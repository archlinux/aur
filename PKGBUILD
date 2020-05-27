# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: sparzz
pkgname=vulkan-validation-layers-git
pkgver=1.2.140_2020.05.27
pkgrel=1
epoch=
pkgdesc="vulkan validation layers build from source. My oder Vulkan packages from the AUR depends on this packages. For install instruction and the order of install visit my GitHub page ----> https://github.com/sparzz/vulkan-arch-aur"
arch=(x86_64)
url="https://github.com/sparzz/vulkan-arch-aur"
license=('Apache')
groups=()
depends=()
makedepends=("cmake"
            "git"
            "glslang-sparzz-git"
            "vulkan-loader-git"
            "vulkan-headers-sparzz-git"
            "spirv-headers-sparzz-git")
checkdepends=()
optdepends=()
provides=(vulkan-validation-layers-git)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("Vulkan-ValidationLayers::git+https://github.com/KhronosGroup/Vulkan-ValidationLayers.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()






package() {
	cmake setup Vulkan-ValidationLayers \
	-DGLSLANG_INSTALL_DIR=/usr/local/bin \
	-DVULKAN_HEADERS_INSTALL_DIR=/usr/local/share/vulkan/registry \
	-DVULKAN_HEADERS_INSTALL_DIR=/usr/local/include/vulkan \
	-DVulkanRegistry_DIR=/usr/local/share/vulkan/registry \
	-DSPIRV_HEADERS_INSTALL_DIR=/usr/local/include/spirv \
	-DSPIRV_HEADERS_INSTALL_DIR=/usr/local/lib/cmake/SPIRV-Headers \
	-DVULKAN_LOADER_INSTALL_DIR=/usr/local/lib \
	-DVulkanHeaders_INCLUDE_DIRS=/usr/local/share/vulkan/registry \
    -DVulkanHeaders_INCLUDE_DIRS=/usr/local/include/vulkan \
	cmake configure Vulkan-ValidationLayers
	make DESTDIR="$pkgdir" install
}
