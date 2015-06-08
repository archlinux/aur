
pkgname=pyparticles
pkgver=0.3.5
pkgrel=1
pkgdesc="Particles simulation toolbox for python, with some force model and integrations methods"
arch=(any)
license=('GPL3')
url="http://pyparticles.wordpress.com/"
depends=('python2'  'python2-opengl' 'python2-scipy' 'python2-numpy' 'python2-matplotlib' )


source=("http://sourceforge.net/projects/pyparticles/files/PyParticles-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha1sums=('89f207b23449f33ca7ece9533d4571ad440fcd91')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  echo ${pkgdir}
  python2 setup.py install --root=${pkgdir} --prefix=usr --optimize=1
}
