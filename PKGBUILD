# Maintainer: dreieck <felix )dot( becker (at( zih )dot) tu-dresden |dot| de>.

pkgname="python-fortranformat"
pkgver="0.2.3"
pkgrel="5"
pkgdesc="Python module to read and write data with fortran format strings."
arch=('any')
url='https://pypi.python.org/pypi/fortranformat'
license=('MIT')

_srcfile="fortranformat-${pkgver}.tar.gz"

source=("http://pypi.python.org/packages/source/f/fortranformat/${_srcfile}" "website.html")

md5sums=('d78c5a320fedcbdf21f823cd18e28ac0' '444b8a8a633ac4db159165912e17e714')
sha512sums=('4f4470a58684143e95a53fedf1f8a925a9bb27eb472eae480aeedc59fa45924b8bde5b173795183e9d1c4ce8c211a62a7e401a90c11dd29e958793723dc94584' 'b527d3fa53bea7abae6600da11fb271901940f8cb93a9a84237a6de548415c1f470b387d75fe76968480a148e11df4ec5be8e3e8cbc45dc94deadedab4ee59dd')

build()
{
  _extractdir="${srcdir}/fortranformat-${pkgver}"
  
  cd "${_extractdir}"
  python setup.py build
}

package()
{
  _extractdir="${srcdir}/fortranformat-${pkgver}"
  
  mkdir -p "usr/share/licenses/${pkgname}"
  cd "${_extractdir}"
  python setup.py install --prefix=/usr --root "${pkgdir}"
  
  _docdir="usr/share/doc/${pkgname}"
  mkdir -p "${pkgdir}/${_docdir}"
  cp -v "${srcdir}/website.html" "${pkgdir}/${_docdir}/usage.html"
}

