# Maintainer: cstamas <cstamas at crysys dot hu>

pkgname=python-dotnetfile
pkgver=0.2.9 
pkgrel=1
pkgdesc='Python Library to parse the CLR header of .NET assemblies'
url='https://github.com/pan-unit42/dotnetfile'
arch=('any')
license=('MIT')
depends=('python' 'python-pefile' 'python-dncil')
makedepends=('python-setuptools' 'python-wheel' 'python-installer')
source=(https://github.com/pan-unit42/dotnetfile/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('fe1109ed9ef75d69db7044fc196568ca9c343f0a41250113b198aa6599c0fb77e5b59ff6ef13f84f568b687e942c24fe554f7e1f854e257f887060817ab0fba2')
b2sums=('4f0ee9ece08b165f9c5adf903d0b759e51d91dff717565efd284c3c057043de2f19944d125e41952e1337ee76d601e5911d87aaa326449702362ca2dbad3846e')

build() {
  cd dotnetfile-${pkgver}
  python setup.py bdist_wheel
}

package_python-dotnetfile() {
  cd dotnetfile-${pkgver}
  python -m installer --no-compile-bytecode --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README* -t "${pkgdir}/usr/share/doc/${pkgname}"
}
