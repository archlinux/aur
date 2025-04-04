# Maintainer: jacopotediosi <jacopotediosi at gmail dot com>

_pkgname=frida
pkgname=python-$_pkgname-bin
pkgver=16.7.4
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
sha256sums_i686=('96b4a58c04b796f800bf3bf5f9605a472341b948427ec86b602c753afc426f62')
sha256sums_x86_64=('4b961d1bd5caaf83a01d1f39ebe66bb26f826178a2b6e611a41e8968980a79c1')
sha256sums_armv7l=('5e9905a440d81d5da25f33fa2e91baf4f863e26acafe5c6d411a13622aa63bee')
sha256sums_aarch64=('cdb03da49d9905b79ad25435b111f8e0b2e4861deaaafbd2d4b8bb48767e9dc4')

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
