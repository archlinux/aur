# Maintainer: jacopotediosi <jacopotediosi at gmail dot com>

_pkgname=frida
pkgname=python-$_pkgname-bin
pkgver=17.0.1
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
sha256sums_i686=('d24ebedc60b459073d65fa98ca085808259d12964d65d3fd3b2ff0d41893d309')
sha256sums_x86_64=('d4ca8311e7c6fe4bcb87cd502ea2e591c23dbdfdd4a98c5d991edb76aa72f714')
sha256sums_armv7l=('31a9dcd7e23d13ec4fa325aada08947b3a0ce00adde8bfab2991cc0f8fb0a31f')
sha256sums_aarch64=('18b6ef0c49a5dd3b5eb9c179ce51c09bcf835d06a3a13a9386bafffa6fd5530d')

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
