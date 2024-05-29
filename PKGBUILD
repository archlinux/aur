# Mantainer: Snaporaz
# Contributor: Andrea Pelloni <apelloni@ethz.ch>

pkgbase="python-symbolica"
pkgname=("python-symbolica")
pkgver=0.6.0
pkgrel=3
pkgdesc="Symbolica is a blazing fast and modern computer algebra system which aims to handle huge expressions. It can easily be incorporated into existing projects using its Python, Rust or C++ bindings."
arch=('x86_64')
makedepends=('python-wheel')
license=('Custome')
url=https://github.com/benruijl/symbolica

_name=${pkgname#python-}
_py=cp37
_wheel="${_name//-/_}-$pkgver-$_py-abi3-manylinux_2_34_x86_64.whl"
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/$_wheel")

package() {
    cd $srcdir
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	wheel unpack --dest=$pkgdir/$site_packages $_wheel
}

sha256sums=('0508b996ba4f72981510a9f27bdb3ad01489fa82748772712232d6a08810bada')
