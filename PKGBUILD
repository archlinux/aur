# Maintainer: Maksymilian Jopek <maks.aur@jopek.eu>
pkgname=portablemc
pkgver=4.1.0
pkgrel=1
pkgdesc='An easy-to-use Python CLI Minecraft launcher'
arch=('any')
url='https://github.com/mindstorm38/portablemc'
license=('GPL3-only')
depends=('python')
provides=('portablemc')

source=(
  "$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/5a/c7/a149d720df4ba676ae5557dc154c0668dc5e1c5ab2d3c59da45eb1080467/portablemc-4.1.0.tar.gz"
  'portablemc'
)

sha256sums=(
  'a0270fc704fbfb181ea8bac9a155b51f403a37b518e3ddd9878612eb1b8e34c5'
  '65df24d73666d5a7f5eaac5beb48132b4f5cf0022878c3468afe7711cd275f45'
)

prepare() {
  sed -Ei 's/(LAUNCHER_VERSION.*".*)"/\1 (AUR)"/' "$pkgname-$pkgver/portablemc/__init__.py"
}         

package() {
  mkdir -p "$pkgdir/usr/lib/portablemc"
  cp -r "$pkgname-$pkgver/portablemc" "$pkgdir/usr/lib/portablemc"
  install -m 755 -DT portablemc "$pkgdir/usr/bin/portablemc"
}
