# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-symbola-ib
pkgver=13.00
pkgrel=1
pkgdesc='Infinality configuration for Symbola'
url='https://dn-works.com/ufas/'
arch=('any')
depends=('ttf-symbola')
groups=('infinality-bundle-fonts')
license=('custom')
source=('45-symbola.conf'
        '90-tt-symbola.conf')
sha512sums=('e30c8c2ccf70f89602e2326fc969d1ccaa1a14fb07ff19314d98554c1f3051078476a3fb8bce2ee56e22cd1574cd5d6fd2efd5eb4ca88ca04e9cd4586e29c4fe'
            'af22a299541b042694ce1b962beef101b612a0992318fb8c9a003defbd4e53c2ffbcb9f584eaa8d0b1fd55cfa175c978aaa495837242dfa38c74d51b19d11044')

package() {
    install -Dm644 -t "$pkgdir/etc/fonts/conf.avail/" [0-9]*.conf
    install -dm644 "$pkgdir/etc/fonts/conf.d"
    cd "$pkgdir/etc/fonts/conf.d"
    ln -s ../conf.avail/*.conf .
}
