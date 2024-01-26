# Maintainer: John Lane <archlinux at jelmail dot com>

pkgname=aws-ssm-tools-git
pkgver=v1.6.0
pkgrel=1
pkgdesc="Tools for AWS Systems Manager: ec2-session ecs-session ec2-ssh ssm-tunnel ssm-session ssm-ssh"
url="https://github.com/mludvig/aws-ssm-tools"
depends=('python' )
makedepends=('python3' 'python-setuptools' 'git' )
license=('Apache-2.0')
arch=('any')
source=("git+https://github.com/mludvig/aws-ssm-tools.git#tag=$pkgver")
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/aws-ssm-tools
  git describe --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/aws-ssm-tools
    python setup.py build
}

package() {
    cd $srcdir/aws-ssm-tools
    python setup.py install --root="$pkgdir" --optimize=1 
}
