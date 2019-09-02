# Maintainer: Oskar Roesler <oskar@oskar-roesler.de>

pkgdesc='Utilities for building Arch packages for ROS stacks.'
url="https://github.com/ros-melodic-arch/ros-build-tools-py3"

pkgname='ros-build-tools-py3'
pkgver='0.3.0'
arch=('any')
pkgrel=2
license=('BSD')
makedepends=()
optdepends=('python3' 'python-argparse' 'python-yaml' 'python-termcolor' 'python-certifi')
depends=('bash')
provides=('ros-build-tools')
conflicts=('ros-build-tools')

pkg_destination_dir="/usr/share/ros-build-tools"

source=('fix-python-scripts.sh'
        'clear-ros-env.sh'
        'create_pkgbuild.py')

sha256sums=('5528486d640d91136276edda2075aefc06f360e6297e556051bae57b9479aeda'
	    'e71cdd2288bf3a659fa40824464e64031d2ec45fab57f120d8c49b92954d5ad5'
	    '3cefd5b46df589da2ea0a90756d645ea54341522a3517d6281a6e2f5bdc65225')
build() {
  return 0
}

package() {
  mkdir -p ${pkgdir}${pkg_destination_dir}
  for file in "${source[@]}"; do
    cp $file ${pkgdir}${pkg_destination_dir}/$file
  done
}

