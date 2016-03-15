pkgname=python2-artifacts
_pkgcode=artifacts
pkgver=20160114
pkgrel=1
pkgdesc="A free, community-sourced, machine-readable knowledge base of forensic artifacts that the world can use both as an information source and within other tools." 
url="https://github.com/ForensicArtifacts/artifacts"
arch=('any')
license=('Apache')

makedepends=('python2')

md5sum=9db32dd9429fb0e09aa5998dfd78067c
source=(https://pypi.python.org/packages/source/a/$_pkgcode/$_pkgcode-$pkgver.tar.gz#md5=$md5sum)
md5sums=($md5sum)

build() {
  cd $srcdir/${_pkgcode}-${pkgver}

  python2 setup.py build
}

package() {
  cd $srcdir/${_pkgcode}-${pkgver}
  python2 setup.py install --root="${pkgdir}"
}
