# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-debian-parser
_name=${pkgname:7}
__name=$(echo $_name | tr '-' '_')
pkgver=0.1.2
pkgrel=1
pkgdesc="A simple pure-python module to parse RFC822-like Debain data formats. Including Pacakges, Control, Release files."
arch=(any)
url="https://pypi.org/project/$_name"
license=('Apache')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$__name/$__name-$pkgver.tar.gz)
sha256sums=('618252f70eac9c3911567d87c740916f9e04156fe4cbd0bf8838178b63d68cfb')

package() {
    cd ${srcdir}/${__name}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
