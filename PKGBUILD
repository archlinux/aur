# Maintainer: Rayshawn Levy <sneekyfoxx09@gmail.com>
# Maintained at https://github.com/sneekyfoxx/Superuser, feel free to submit patches

pkgname=superuser
pkgver=1
pkgrel=1
_pyver=1
_pybasever=1
_pymajver=1
pkgdesc="A shell utility that bundles custom built versions of five common shell utilities."
arch=('x86_64')
license=('GPL-3.0')
url="https://github.com/sneekyfoxx/Superuser"
depends=('nim' 'musl' 'upx')
source=("https://github.com/sneekyfoxx/Superuser")

build() {
  cd "${srcdir}/Superuser"

  if [ ! -d "${HOME}/.local/bin" ]; then
    mkdir "${HOME}/.local/bin";
  fi

  mkdir "${srcdir}/bin"
  "${srcdir}/build.sh" -c
}

package() {
  cd "${srcdir}/Superuser"

  install -m755 "${pkgdir}/bin/superuser" "/usr/bin/superuser"
}
