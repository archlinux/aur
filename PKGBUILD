# Maintainer: Skye Viau <skye.viau@outlook.com>

pkgname=simtoolkitpro-appimage
pkgver=0.6.11
pkgrel=1
pkgdesc="The all-in-one flight simulation EFB"
license=('custom')
provides=('simtoolkitpro')
conflicts=('simtoolkitpro')
arch=('x86_64')
url="https://simtoolkitpro.co.uk/"
depends=('qt5-base')
options=(!strip)
_desktop_name=SimToolkitPro.desktop
_filename=SimToolkitPro-${pkgver}-${arch}.Setup.AppImage
source=(
  https://cdn.simtoolkitpro.co.uk/automated-builds/${_filename}
  SimToolkitPro.desktop
)
sha512sums=(
  'dca29afdc018c6be34558016c9660cd891af0dc32e25274ac2e7407cda05d2bd00bc239ab9b10d672f14ad3a7b5c002e92d4f64f304162f63894c5d2257fc426'
  'e3a9b1a26d6717eefb1e97f08ec9f97fcd7dc6bc6ffc046f1c13405f20511a6cc048afe0eeb33310cb6936755f015bbd96f5d9d0d4b59e31d0949cba4846e346'
)

prepare() {
  cd "$srcdir"
  chmod +x $_filename
}

package() {
  echo "Starting install"
  install -Dm755 $_filename "$pkgdir"/usr/bin/SimToolkitPro.AppImage
  echo "Installing desktop launch file to $pkgdir/usr/bin/SimToolkitPro.AppImage"
  install -Dm755 ${srcdir}/${_desktop_name} "$pkgdir"/usr/share/applications/${_desktop_name}
}
