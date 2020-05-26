# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: sparzz
pkgname=vulkan-validation-layers-git
pkgver=1.2.140_final_1
pkgrel=1
epoch=
pkgdesc="vulkan validation layers build from source"
arch=(x86_64)
url="https://github.com/KhronosGroup/Vulkan-ValidationLayers.git"
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
	cmake configure Vulkan-ValidationLayers
	make DESTDIR="$pkgdir" install
}
