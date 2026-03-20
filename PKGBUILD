pkgname=kawai-focus-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Kawai-Focus is a focus-training app based on the Pomodoro timer."
arch=('x86_64')
url="https://github.com/Arduinum/kawai-focus-v2"
license=('MIT')

depends=('webkit2gtk-4.1' 'libsoup3' 'gtk3' 'cairo' 'gdk-pixbuf2' 'glib2' 'pango')

source=("Kawai-Focus_${pkgver}_amd64.deb::https://github.com/Arduinum/kawai-focus-v2/releases/download/${pkgver}-alpha.1/Kawai-Focus_${pkgver}_amd64.deb")

sha256sums=('3ff49a4e124daafb5e660738c275b53ccf3116e759cd6cafde8b77b2257799a6')

package() {

  cd "$srcdir"

  # распаковываем deb
  ar x Kawai-Focus_${pkgver}_amd64.deb

  # извлекаем файлы пакета
  tar -xf data.tar.*

  # копируем всё в pkgdir
  cp -r usr "$pkgdir"
}
