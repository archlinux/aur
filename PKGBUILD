pkgname=kawai-focus-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Kawai-Focus is a focus-training app based on the Pomodoro timer."
arch=('x86_64')
url="https://github.com/Arduinum/kawai-focus-v2"
license=('MIT')

depends=('webkit2gtk-4.1' 'libsoup3' 'gtk3' 'cairo' 'gdk-pixbuf2' 'glib2' 'pango' 'gstreamer' 'gst-plugins-base' 'pipewire' 'gst-plugin-pipewire' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')

source=("Kawai-Focus_${pkgver}_amd64.deb::https://github.com/Arduinum/kawai-focus-v2/releases/download/${pkgver}-alpha.1/Kawai-Focus_${pkgver}_amd64.deb")

sha256sums=('d4e915924a828c26a9a98a1d5f25268ea3e8b284f7a8e64889565c42ac0a52b1')

package() {

  cd "$srcdir"

  # распаковываем deb
  ar x Kawai-Focus_${pkgver}_amd64.deb

  # извлекаем файлы пакета
  tar -xf data.tar.*

  # копируем всё в pkgdir
  cp -r usr "$pkgdir"
}
