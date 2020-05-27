# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: sparzz
pkgname=spirv-cross-sparzz-git
pkgver=2020.05.27
pkgrel=1
epoch=
pkgdesc="SPIR-V Cross build from source. My Vulkan packages from the AUR depends on this package. For install instruction and order of the of the install visit my GitHub page --> https://github.com/sparzz/vulkan-arch-aur  "
arch=(x86_64)
url="https://github.com/sparzz/vulkan-arch-aur"
license=('Apache')
groups=()
depends=("yay"
        "make"
        "cmake")
makedepends=("cmake"
            "git"
            "make")
checkdepends=()
optdepends=()
provides=(spirv-cross-sparzz-git)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("SPIRV-Cross::git+https://github.com/KhronosGroup/SPIRV-Cross.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()




package() {
	cmake setup SPIRV-Cross \
	-DGLSLANG_INSTALL_DIR=/usr/local/bin \
	-DSPIRV_HEADERS_INSTALL_DIR=/usr/local/include/spirv \
	-DSPIRV_HEADERS_INSTALL_DIR=/usr/local/lib/cmake/SPIRV-Headers \
	cmake configure SPIRV-Cross
	make DESTDIR="$pkgdir" install
}
