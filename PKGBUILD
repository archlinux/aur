# Maintainer: Skye Viau <skye.viau@outlook.com>

pkgname=simtoolkitpro-appimage
pkgver=0.6.42
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
  '4b55e67d765e00b433176a75a6bb68583dafa78c840ec81b7d1aa87e7acf9becb2d2c0d6b6b011d998c29503fdf6e3284e3db6e8b9d40251b36b5cf3db49b2cb'
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
