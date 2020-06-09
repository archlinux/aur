# Maintainer: sparzz
pkgname=vulkan-headers-sparzz-git
pkgver=1.2.141_2020.06.09
pkgrel=1
epoch=
pkgdesc="Vulkan Headers build from source. My oder Vulkan packages from the AUR depends on this packages. For install instruction and the order of install visit my GitHub page ----> https://github.com/sparzz/vulkan-arch-aur"
arch=(x86_64)
url="https://github.com/sparzz/vulkan-arch-aur"
license=('Apache')
groups=()
depends=("yay"
        "glslang-sparzz-git"
        "spirv-headers-sparzz-git")
makedepends=("cmake"
            "git"
            "glslang-sparzz-git"
            "make")
checkdepends=()
optdepends=()
provides=(vulkan-headers-sparzz-git)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()






package() {
	cmake setup Vulkan-Headers \
	-DGLSLANG_INSTALL_DIR=/usr/local/bin \
	-DSPIRV_HEADERS_INSTALL_DIR=/usr/local/include/spirv \
	-DSPIRV_HEADERS_INSTALL_DIR=/usr/local/lib/cmake/SPIRV-Headers \
	cmake configure Vulkan-Headers
	make DESTDIR="$pkgdir" install
}
