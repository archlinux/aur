
pkgname=pyparticles
pkgver=0.4.0
pkgrel=1
pkgdesc="Particles simulation toolbox for python, with some force model and integrations methods"
arch=(any)
license=('GPL3')
url="http://pyparticles.wordpress.com/"
depends=('python'  'python-opengl' 'python-scipy' 'python-numpy' 'python-matplotlib' )


source=("https://github.com/simon-r/PyParticles/archive/refs/tags/v0.4.0.tar.gz")
sha256sums=('a49817a5334e18bd74e310c9b1322818ae592ee05feff236151250dab3ee8889')

build() {
  cd "$srcdir/PyParticles-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/PyParticles-$pkgver"
  echo ${pkgdir}
  python setup.py install --root=${pkgdir} --prefix=usr --optimize=1
}
