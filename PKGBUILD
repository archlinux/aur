# Maintainer: Oleg Pervushin <alec.ext@gmail.com>
pkgname=minetime
pkgver=1.0.10
pkgrel=1
pkgdesc="MineTime is a modern, intuitive and smart calendar application."
arch=('x86_64')
url="https://github.com/marcoancona/MineTime"
license=()
depends=()

# Package
source_x86_64=("${url}/releases/download/v${pkgver}/MineTime_${pkgver}_amd64.deb")
md5sums_x86_64=('2a87b708c5affc025325fc14158c107c')

# Icon and desktop file
source=( minetime )
md5sums=( '45d6f8f0a3e78e5f32ac20b83f5b500e' )

package() {
  cd "${srcdir}"
  tar -xJC "${pkgdir}" -f data.tar.xz

	# Create /usr/bin for the executable
	mkdir "${pkgdir}/usr/bin"
  install -m 755 "${startdir}/minetime" "${pkgdir}/usr/bin/minetime"
}

