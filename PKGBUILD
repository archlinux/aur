# Maintainer: Jason Nader <jason.nader [] protonmail.com>

pkgname=python-ffmpeg-progress-yield
pkgver=0.0.4
pkgrel=1
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=('any')
url="https://github.com/slhck/ffmpeg-progress-yield"
license=('MIT')
depends=('python-colorama' 'python-tqdm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('8e5bc0c4565586a35c8d584b2976701251387574ba95aa9077598b689dda81e68a17b0294e76511cc1536347b1aa8a29ae3fd79b32bb582c8b2c17712549d098')

build() {
  cd ffmpeg-progress-yield-$pkgver
  python setup.py build
}

package() {
  cd ffmpeg-progress-yield-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}