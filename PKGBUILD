# Contributor: Oskar Roesler <oskar@oskar-roesler.de>

pkgdesc='Utilities for building Arch packages for ROS stacks.'
url="https://github.com/ros-melodic-arch/ros-build-tools-py3"

pkgname='ros-build-tools-py3'
pkgver='0.3.1'
arch=('any')
pkgrel='5'
license=('BSD')
makedepends=()
optdepends=('python3' 'python-yaml' 'python-termcolor' 'python-certifi')
depends=('bash')
# provides=('ros-build-tools') # removed due to this tool not being needed anymore; help discover holdover dependents on py3 package
conflicts=('ros-build-tools')

pkg_destination_dir="/usr/share/ros-build-tools"

source=('clear-ros-env.sh'
        'create_pkgbuild.py')

sha256sums=('9626b8e5f3865f5640660f4a7f6a00afc4db8448b95329b4d5a64bd691677a88'
	    '6171500f4e807e170f3705277032107b3902502a7fcccf8ab5b300a35580ebf7')
build() {
  return 0
}

package() {
  mkdir -p ${pkgdir}${pkg_destination_dir}
  for file in "${source[@]}"; do
    cp $file ${pkgdir}${pkg_destination_dir}/$file
  done
}

