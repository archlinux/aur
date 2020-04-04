# Maintainer: Jeffrey Zhang <zhang.lei.fly@gmail.com>

pkgname=ansible-runner
pkgver=1.4.6
pkgrel=1
pkgdesc="A tool and python library that helps when interfacing with Ansible directly"
arch=("any")
url="https://github.com/ansible/ansible-runner"
license=('Apache')
depends=("python-psutil"
         "python-pexpect"
         "python-daemon"
         "python-yaml"
         "python-six")
makedepends=('python-setuptools')
source=("https://github.com/ansible/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7a36fae4589daaea7bdc4c8f9b3ca8ffe05a170c737162214f419dd9d7488aa8')

build() {
    cd ${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
