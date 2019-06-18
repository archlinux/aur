# Maintainer: Oskar Roesler <oskar@oskar-roesler.de>

pkgdesc='Utilities for building Arch packages for ROS stacks.'
url="https://github.com/ros-melodic-arch/ros-build-tools-py3"

pkgname='ros-build-tools-py3'
pkgver='0.2.1'
arch=('any')
pkgrel=1
license=('BSD')
makedepends=()
optdepends=('python3')
depends=('bash')
provides=('ros-build-tools')
conflicts=('ros-build-tools')

pkg_destination_dir="/usr/share/ros-build-tools"

source=('fix-python-scripts.sh'
        'stack-install-tools.sh'
        'create-arch-ros-package-legacy.sh'
        'PKGBUILD.rostemplate'
        'get_stack_dependencies.py'
        'generate-python-patch.sh'
        'clear-ros-env.sh')

build() {
  return 0
}

package() {
  mkdir -p ${pkgdir}${pkg_destination_dir}
  for file in "${source[@]}"; do
    cp $file ${pkgdir}${pkg_destination_dir}/$file
  done
}

md5sums=('ed01573e0ecc0f7ca451d7e2849cc5ee'
         '79ae7fb600e116623a42631d15d66a87'
         'ac82eca7efc9f0ff7e8b976a83692868'
         'f3378832c3ba121f7c9e17dc43c8b1d4'
         'd257f7f20384e894b0431ee61068aa96'
         '8d6d7eb89a12c449497b209f1a06655b'
         '07f5253eb3f8cb5295c32026a20ab6c0')
