# Maintainer: Qontinuum <qontinuum@artixlinux.org>

pkgname='chromium-extension-privacybadger'
pkgver=2021.8.11
pkgrel=1
pkgdesc="Block third party tracking in your browser"
license=('GPL3')
arch=('any')
url="https://privacybadger.org/"
optdepends=('chromium')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.crx::https://www.eff.org/files/privacy_badger-$pkgver.crx")
b2sums=('ff250bd2dfee3218a11979b995f608e87d1a7701ef8e45caa0ef54818ebe29fd09e5d019eaf9a62d7fd6acd0afbed3b0c5dd0e6607fec557608663e0055b3fcf')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json
}

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json "$pkgdir/usr/share/chromium/extensions/pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json"
}
