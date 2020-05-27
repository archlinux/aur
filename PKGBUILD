# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: sparzz
pkgname=vulkan-tools-git
pkgver=1.2.140_2020.05.27.r2
pkgrel=1
epoch=
pkgdesc="Vulkan-tools build from source. My Vulkan packages from the AUR depends on this package. For install instruction and order of the of the install visit my GitHub page --> https://github.com/sparzz/vulkan-arch-aur"
arch=(x86_64)
url="https://github.com/KhronosGroup/Vulkan-Tools.git"
license=('Apache')
groups=()
depends=()
makedepends=("cmake"
            "git"
            "spirv-headers-sparzz-git"
            "vulkan-validation-layers-git"
            "vulkan-loader-git"
            "vulkan-headers-sparzz-git"
            "vulkan-extensionlayer-sparzz-git"
            "glslang-sparzz-git")
checkdepends=()
optdepends=()
provides=(vulkan-tools-git)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("Vulkan-Tools::git+https://github.com/KhronosGroup/Vulkan-Tools.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()






package() {
	cmake setup Vulkan-Tools \
	-DVULKAN_VALIDATIONLAYERS_INSTALL_DIR=/usr/local/lib \
	-DVULKAN_VALIDATIONLAYERS_INSTALL_DIR=/usr/local/share/vulkan/explicit_layer.d \
	-DSPIRV_HEADERS_INSTALL_DIR=/usr/local/lib/cmake/SPIRV-Headers \
	-DSPIRV_HEADERS_INSTALL_DIR=/usr/local/include/spirv \
	-DVulkanRegistry_DIR=/usr/local/share/vulkan/registry \
	-DVULKAN_LOADER_DIR=/usr/local/lib/pkgconfig \
	-DVULKAN_LOADER_INSTALL_DIR=/usr/local/lib \
	-DVULKAN_HEADERS_INSTALL_DIR=/usr/local/include/vulkan \
	-DVULKAN_HEADERS_INSTALL_DIR=/usr/local/share/vulkan/registry \
	-DGLSLANG_INSTALL_DIR=/usr/local/bin \
	cmake configure Vulkan-Tools
	make DESTDIR="$pkgdir" install
}
