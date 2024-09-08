# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Cravix <dr.neemous@gmail.com>

pkgname=python-pygame-sdl2
_dir=pygame_sdl2
pkgver=8.3.1.24090601
pkgrel=1
epoch=1
pkgdesc='Reimplementation of portions of the pygame API using SDL2'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/renpy/${_dir}"
license=(
	'LGPL2.1'
	'ZLIB'
)
depends=(
	'python'
	'sdl2_image'
	'sdl2_mixer'
	'sdl2_ttf'
)
makedepends=(
	'cython0'
	'git'
	'python'
	'python-setuptools'
)
source=("git+${url}.git#tag=renpy-${pkgver}")
b2sums=('a45445d24f85bf90ee8e0b58fbca6576fc6c2b8eaff2bb894c83a61d6374bca9a93683ecc2598d0b86881f531bde429fc2b8a49b8de67938db34daa3ee712523')

build() {
	cd "$_dir"
	python setup.py build
}

package() {
	cd "$_dir"
	python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build
	install -Dm 644 'COPYING.ZLIB' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
