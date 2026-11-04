# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=django-soft-delete
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.0.23
pkgrel=1
pkgdesc="Soft delete models, managers, queryset for Django"
arch=("any")
url="https://github.com/san4ezy/django_softdelete"
license=('MIT')
depends=('python-django')
makedepends=('python-installer')
_wheel="${_pipname}-${pkgver}-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/91/9e/77375a163c340fff03d037eac7d970ce006626e6c3aea87b5d159f052f8b/$_wheel")
noextract=("$_wheel")
sha256sums=('dd2133d4925d58308680f389daa2e150abf7b81a4f0abbbf2161a9db3b9f1e74')

prepare() {
    bsdtar -xOf "$srcdir/$_wheel" \
        "${_pipname}-${pkgver}.dist-info/licenses/LICENSE" > "$srcdir/LICENSE"
}

package() {
    python -m installer --destdir="${pkgdir}" "$srcdir/$_wheel"
    install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
