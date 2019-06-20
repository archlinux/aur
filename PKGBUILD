# Maintainer: Neal Oakey <public@oakey-dev.eu>
pkgname=syncrepo
pkgver=20190620
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
sha512sums=('a652cff50db85ae1df07d75bd593ff71720ee4e4322d3685dc5d0ab77a6b0710c0708aa006ad6b4171723d1ffe3c5f26ea184b7c6d2213d1ced11022d87e3c28'
            '547fcb42b85b13d8fa35d51280a760549a9181097784bbd9d95d1e5e0890ad3bf41f50be3340fa5adba3c3ff608b0bd6468b677e216efbb51caac195cc6b8e26'
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
