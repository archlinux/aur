# Maintainer: mark.blakeney at bullet-systems dot net
# Original Maintainer: Jameson Pugh <imntreal@gmail.com>

_pkgname=skypeforlinux
pkgname="$_pkgname-stable-bin"
pkgver=8.94.0.422
pkgrel=1
pkgdesc="Skype for Linux - Stable/Release Version"
arch=("x86_64")
url="http://www.skype.com"
license=("custom")
depends=("gtk3" "libxss" "alsa-lib" "libxtst" "libsecret" "nss"
         "glibc>=2.28-4")
optdepends=("org.freedesktop.secrets: keyring/password support"
            "libappindicator-gtk3: systray icon support")
conflicts=("$_pkgname" "$_pkgname-bin" "$_pkgname-preview-bin"
           "$_pkgname-beta-bin" "skype")
provides=("$_pkgname" "skype")
install=install.sh
source=(
"https://repo.skype.com/rpm/stable/${_pkgname}_${pkgver}-1.x86_64.rpm"
)
sha256sums=('b23dcf5b9339da5a737a956fe6ce8bc87649e0b5550ac60a6d2e5fb68aaf4e01')

package() {
  cd $pkgdir
  bsdtar -xf $srcdir/${_pkgname}_${pkgver}-1.x86_64.rpm
  rm -rf "$pkgdir/usr/lib/.build-id"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/share/$_pkgname/LICENSES.chromium.html" \
     "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
