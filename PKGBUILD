# Maintainer: Jason Nader <jason.nader [] protonmail.com>
# Maintainer: Sian1468 <setthawut DOT a AT protonmail DOT com>

pkgname=python-ffmpeg-progress-yield
pkgver=0.1.1
pkgrel=1
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=('any')
url="https://github.com/slhck/ffmpeg-progress-yield"
license=('MIT')
depends=('python-colorama' 'python-tqdm')
provides=('ffmpeg-progress-yield')
conflicts=('ffmpeg-progress-yield')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('1064366941669930446da671b278a049cbaf2ed562615068a9ea87711b4817761c71a12e7eed30cc8f234a37f62b3582738e2fd531eee0ca82ff6bbb2c0f7ec1')

build() {
  cd ffmpeg-progress-yield-$pkgver
  python setup.py build
}

package() {
  cd ffmpeg-progress-yield-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
