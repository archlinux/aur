# Maintainer:  Christian Holme <hcmh (at) kolabnow (dot) com>

_name=bash_kernel
pkgname=jupyter-${_name}
pkgver=0.4.1
pkgrel=1
pkgdesc="A Jupyter kernel for bash"
arch=('any')
url="https://github.com/takluyver/bash_kernel"
license=('BSD')
depends=('jupyter' 'jupyter-notebook' 'bash')
makedepends=('python-pip')
#source=("https://github.com/takluyver/bash_kernel/archive/${pkgver}.tar.gz"
#        "https://github.com/takluyver/bash_kernel/releases/download/${pkgver}/bash_kernel-${pkgver}-py2.py3-none-any.whl")
source=("https://github.com/takluyver/bash_kernel/releases/download/${pkgver}/bash_kernel-${pkgver}-py2.py3-none-any.whl"
	"https://github.com/takluyver/bash_kernel/raw/master/LICENSE"
	${pkgname}.install)
noextract=("bash_kernel-${pkgver}-py2.py3-none-any.whl"
	   "LICENSE")
sha256sums=('8e6b3a05d8809644d4d78ed8601dce5344dc3fafa099fe467b199f43a86695fd'
            '5b99decdbcae441e047c670b54d017787fb739e22fb1b91d2fc3ef3bafc55ceb'
            'b06d37e6014996d45c95819ae554eebcee3d63c2892025582fdbc2d6416f151a')

package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
