# Maintainer: Jason Nader <jason.nader [] protonmail.com>
# Maintainer: Sian1468 <setthawut DOT a AT protonmail DOT com>

pkgname=python-ffmpeg-progress-yield
pkgver=0.1.0
pkgrel=1
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=('any')
url="https://github.com/slhck/ffmpeg-progress-yield"
license=('MIT')
depends=('python-colorama' 'python-tqdm')
provides=('ffmpeg-progress-yield')
conflicts=('ffmpeg-progress-yield')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('6827df667ac94b37741a26e048c02b0da3113e36aa87e8c1e8aac856ea5710167c5e8571ca64ed6afe8913cedbb52a94d5139c524482b66ea1359ac5de8eff1d')

build() {
  cd ffmpeg-progress-yield-$pkgver
  python setup.py build
}

package() {
  cd ffmpeg-progress-yield-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
