# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: sparzz
pkgname=vulkan-extensionlayer-sparzz-git
pkgver=1.2.140.2020.05.26.1
pkgrel=1
epoch=
pkgdesc="Vulkan ExtensionLayer build from source. My oder Vulkan packages from the AUR depends on this packages. For install instruction and the order of install visit my GitHub page ----> https://github.com/sparzz/vulkan-arch-aur"
arch=(x86_64)
url="https://github.com/sparzz/vulkan-arch-aur"
license=('Apache')
groups=()
depends=("yay"
        "glslang-sparzz-git"
        "vulkan-headers-sparzz-git"
        "spirv-headers-sparzz-git")
makedepends=("cmake"
            "git"
            "make"
            "vulkan-headers-sparzz-git")
checkdepends=()
optdepends=()
provides=(vulkan-extensionlayer-sparzz-git)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("Vulkan-ExtensionLayer::git+https://github.com/KhronosGroup/Vulkan-ExtensionLayer.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()






package() {
	cmake -DVULKAN_HEADERS_INSTALL_DIR=/usr/local/include/vulkan -DVULKAN_REGISTRY_INSTALL_DIR=/usr/local/share/vulkan/registry -DVulkanRegistry_INSTALL_DIR=/usr/local/share/vulkan/registry -DSPIRV_HEADERS_INSTALL_DIR=/usr/local/include/spirv -DGLSLANG_INSTALL_DIR=/usr/local/bin -DVULKAN_HEADERS_INSTALL_DIR_=/usr/local/share/vulkan/registry -DVulkanRegistry_DIR=/usr/local/share/vulkan/registry Vulkan-ExtensionLayer
	make DESTDIR="$pkgdir" install
}
