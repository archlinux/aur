# Maintainer: Jason Nader <jason.nader [] protonmail.com>
# Maintainer: Sian1468 <setthawut DOT a AT protonmail DOT com>

pkgname=python-ffmpeg-progress-yield
pkgver=0.2.0
pkgrel=2
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=('any')
url="https://github.com/slhck/ffmpeg-progress-yield"
license=('MIT')
depends=('python-colorama' 'python-tqdm')
provides=('ffmpeg-progress-yield')
conflicts=('ffmpeg-progress-yield')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('2087c1cf6ff334baaa5d49f5b9b77e14e8336dfd6cc3b80ad41a162a703d1cfa5dc62e23bb98ea24c59c7bfc53ffbd319df8b1d208d8ef95af9c2837edae23dc')

build() {
  cd ffmpeg-progress-yield-$pkgver
  python setup.py build
}

package() {
  cd ffmpeg-progress-yield-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
