# Maintainer: jacopotediosi <jacopotediosi at gmail dot com>

_pkgname=frida
pkgname=python-$_pkgname-bin
pkgver=16.5.6
pkgrel=2

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
sha256sums_i686=('874a6a39674a9fc826f7f53f11ea694cdbde62b1adac6c72d8a6c0822f1b8fa2')
sha256sums_x86_64=('231e4b77d2e243e38e3d9df257ec35dafce07162bf1dd7e57987335941ce7100')
sha256sums_armv7l=('4e970ce119c49e7be77b3965c02acbc4773e60e46abf4ba6b1df26f700ebf023')
sha256sums_aarch64=('421d93af28adb18790cf5516fd1abbca18be4fb9220d17f607152f679e0192c8')

# Built distributions taken from https://pypi.org/project/frida/#files
_py=cp37
_abi=abi3
source=('COPYING')
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
