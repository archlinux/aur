# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nextcloud-upgrade-hook
pkgver=1
pkgrel=2
pkgdesc='Trigger ‘occ upgrade’ and ‘occ maintenance:update:htaccess’ after Nextcloud updates'
arch=(any)
depends=(nextcloud)
source=(nextcloud-post.hook
        nextcloud-post.sh)
sha256sums=('6373d8d22002b309b8857ac1f70c5a881f6b74866c9d21cf5f6a98d99aefaa4c'
            '3a7e173c670e2c1b26953927fba108a9f5a44f2277cbb0a54b7d3697c35dd248')

package() {
    local _libalpm="$pkgdir/usr/share/libalpm"
    install -Dm0644 -t "$_libalpm/hooks/" nextcloud-post.hook
    install -Dm0755 -t "$_libalpm/scripts/" nextcloud-post.sh
}
