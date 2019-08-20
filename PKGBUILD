pkgname=('phonopy')
pkgver=2.2.0
pkgrel=1
pkgdesc="Phonopy is an open source package for phonon calculations at harmonic and quasi-harmonic levels"
arch=('any')
url="https://atztogo.github.io/phonopy"
license=('BSD')
depends=("python-numpy" "python-scipy" "python-h5py" "python-pyaml" "python-matplotlib")
optdepends=("python-spglib" "openmpi")
makedepends=('python-setuptools' 'python')
source=("https://github.com/atztogo/phonopy/archive/v$pkgver.tar.gz")
sha512sums=('74d6058aea179a84dcad9f98e09de69569a1cf62c1163b2142481f85d143a273b14459800485ebac627dcd1d1a71a3151dc69d9067271ed9aec3def8b37cb712')



package() {
  cd "$srcdir"/phonopy-$pkgver
  # uncomment for openmpi build
  sed -i "s/with_openmp = False/with_openmp = True/" setup.py
  python setup.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
