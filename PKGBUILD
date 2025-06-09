# Maintainer: jacopotediosi <jacopotediosi at gmail dot com>

_pkgname=frida
pkgname=python-$_pkgname-bin
pkgver=17.1.3
pkgrel=1

pkgdesc='Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 binary version from PyPi'
arch=('i686' 'x86_64' 'armv7l' 'aarch64')
url='https://www.frida.re'
license=('custom:wxWindows Library License, Version 3.1')

depends=('python' 'nodejs' 'npm')
makedepends=(python-build python-installer python-wheel python-setuptools)
optdepends=('python-typing_extensions: for Python <3.8'
            'rustup: for injecting Rust code into targets')
provides=("python-frida=$pkgver")
conflicts=('python-frida' 'python2-frida')

# Hashes updated by updpkgsums
sha256sums=('5ea1544b51a28bc823b03159190d4108f9fb4f4ef912389f5137c6d295e175b2')
sha256sums_i686=('28cc570e6e6786b4c1f150c5172ce0700aa2ed89bdebd80f30bbbd88dfe2ed45')
sha256sums_x86_64=('e4710b93dacfeff59008a7ff63a74e15e36443bbff48854b975faff62c566a16')
sha256sums_armv7l=('91996c9ba6b0d46cbdc3a4b235988f50d37639daa7e3e8d13987398351c3492b')
sha256sums_aarch64=('7638330fa018a83a8d26710c166d585341bd4790331d847c429554c33748ecab')

# Built distributions taken from https://pypi.org/project/frida/#files
_py=cp37
_abi=abi3
source=("https://raw.githubusercontent.com/frida/frida/refs/heads/main/COPYING")
source_i686=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-$_abi-manylinux_2_5_i686.whl")
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-$_abi-manylinux_2_5_x86_64.whl")
source_armv7l=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-$_abi-manylinux_2_17_armv7l.whl")
source_aarch64=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-$_abi-manylinux_2_17_aarch64.whl")

package() {
  cd "$srcdir"
  python -m installer --destdir="$pkgdir" "$srcdir"/*.whl

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/"
}
