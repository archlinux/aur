# Maintainer: Neal Oakey <public@oakey-dev.eu>
pkgname=syncrepo
pkgver=20191211
pkgrel=1
pkgdesc='A service and timer to sync an archlinux mirror'
arch=('any')
url='https://git.archlinux.org/infrastructure.git/tree/roles/syncrepo/files'
license=('GPL')
depends=('rsync' 'systemd')
backup=('etc/conf.d/syncrepo')
source=('syncrepo'
        'syncrepo.conf'
        'syncrepo.service'
        'syncrepo.timer')
sha512sums=('c8651d3313a8bfef1bd6853012a64a700ccf4888ac21763dfe3fab47bff7288893db48b68d7f1095b302aadc9ac94fed2b2b153311747bfde5751778630c457e'
            '779fc34d63cdaeab3b831f58c663135f4894c8b7eab39b674cd15491ac45fba7ba41de583591729aaff79f9e156e86f4a4f4ef09fe55ccf033f20a0afcec77a2'
            'ae4d26496f63d6084c2e0f02561c2e531bc7fc1f93cd2d8c7bb93ce34c5a6fe6bca9434dc2c8a73e2f3fcfdaa7bc14ac524e303fce41d810ea58ef6ad3558ecf'
            '26d3b91d52f2ebe72a11cc5712f84cc13cc38ce2edcb05a61b8cf93644345bc34e0adf3b2217c34e9da2ddc2799ef37536942fb4acae506d427a2788fd20bd71')

package() {
    install -D -m 755 'syncrepo' "$pkgdir/usr/bin/syncrepo"
    install -D -m 644 'syncrepo.service' "$pkgdir/usr/lib/systemd/system/syncrepo.service"
    install -D -m 644 'syncrepo.timer' "$pkgdir/usr/lib/systemd/system/syncrepo.timer"
    install -D -m 644 'syncrepo.conf' "$pkgdir/usr/lib/syncrepo/syncrepo.conf"
    install -D -m 644 'syncrepo.conf' "$pkgdir/etc/conf.d/syncrepo"
    sed -i 's/^\([A-Z]\)/#\1/' "$pkgdir/etc/conf.d/syncrepo"
}
