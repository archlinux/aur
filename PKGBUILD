# Maintainer: Jason Nader <jason.nader [] protonmail.com>
# Maintainer: Sian1468 <setthawut DOT a AT protonmail DOT com>

pkgname=python-ffmpeg-progress-yield
pkgver=0.1.2
pkgrel=1
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=('any')
url="https://github.com/slhck/ffmpeg-progress-yield"
license=('MIT')
depends=('python-colorama' 'python-tqdm')
provides=('ffmpeg-progress-yield')
conflicts=('ffmpeg-progress-yield')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('0eb888e855b0aded8c2050a1d1e52bb39927847b0191b653232f56b1f865e9ec97668c25f0966155f9b5405bdbf4c79b252dc0da0ea7cad9304c154522d6e096')

build() {
  cd ffmpeg-progress-yield-$pkgver
  python setup.py build
}

package() {
  cd ffmpeg-progress-yield-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
