# Maintainer: aarto <aarto@aur.archlinux.org>
# Contributor: Joel Pickett <mail at vyryls dot com>

_pkgname_suffix=extension-istilldontcareaboutcookies
_firefox_pkgname=firefox-$_pkgname_suffix
_librewolf_pkgname=librewolf-$_pkgname_suffix
_id=idcac-pub@guus.ninja
pkgname=("$_librewolf_pkgname-bin" "$_firefox_pkgname-bin")
pkgver=1.1.8
pkgrel=1
pkgdesc="Debloated fork of the extension I don't care about cookies"
url=https://github.com/OhMyGuus/I-Still-Dont-Care-About-Cookies
arch=('any')
license=('GPL-3.0-only')
noextract=("$_id.xpi")
_number=4213061
source=("idcac-pub@guus.ninja.xpi::$url/releases/download/v$pkgver/istilldontcareaboutcookies-$pkgver.xpi"
        "https://raw.githubusercontent.com/OhMyGuus/I-Still-Dont-Care-About-Cookies/refs/tags/v$pkgver/LICENSE")
b2sums=('4d12bef164c69edc6f3274ea9b8404a0a45b88c7ebe8ac3e33a8219fcc70d6bc2cd07853db28f16dba4a513ed8cea169db7078e2c4dacf9e93e8b79185475ade'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd')

_package() {
  depends=("$1")
  provides=("$1-$_pkgname_suffix")
  conflicts=("$1-$_pkgname_suffix")
  groups=("$1-addons")
  install -Dm644 $_id.xpi "$pkgdir/usr/lib/$1/browser/extensions/$_id.xpi"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$1-$_pkgname_suffix-bin"
}

package_firefox-extension-istilldontcareaboutcookies-bin() {
  _package firefox
}

package_librewolf-extension-istilldontcareaboutcookies-bin() {
  _package librewolf
}
