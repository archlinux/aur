# Maintainer: Jean-Marc Lenoir <archlinux "at" jihemel "dot" com>

pkgname=eatmemory
pkgver=0.1.6
pkgrel=1
pkgdesc="Simple C program to allocate memory from the command line. Useful to test programs or systems under high memory usage conditions"
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/julman99/eatmemory'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5f49eadc5462cebb01afec02caa2729d9885e0f0a251399d1e8f62a726cc0a9e')

build()
{
  cd "${pkgname}-${pkgver}"
  
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  
  make PREFIX=\""${pkgdir}"\"/usr install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
