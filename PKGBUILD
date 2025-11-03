# Maintainer: jacopotediosi <jacopotediosi at gmail dot com>

_pkgname=frida
pkgname=python-$_pkgname-bin
pkgver=17.4.4
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
sha256sums_i686=('d56392cd6dfe0b0e90193f039f01fbbfb7e128c3162e35e58e9f76a8ac4e6203')
sha256sums_x86_64=('e8e397a20c06f57f075fb8a18620ea7a2507ed54db45c203461e92d96142e331')
sha256sums_armv7l=('a4f3638359661afd86fc9e42f51e13e0253c4247fc89eacdba8ecd3a3c647d0c')
sha256sums_aarch64=('53bb970f281bfb975713b4fae1c600518a43a0dcdb435af44ea624ea1387a581')

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
