# Author: mosra <mosra@centrum.cz>
pkgname=blender-plugin-gltf-exporter-git
pkgver=6986b5b
pkgrel=1
pkgdesc="Khronos Blender glTF 2.0 Exporter (Git version)"
arch=('i686' 'x86_64')
url="https://github.com/KhronosGroup/glTF-Blender-Exporter"
license=('Apache')
depends=('blender')
source=("git+git://github.com/KhronosGroup/glTF-Blender-Exporter.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/glTF-Blender-Exporter"
    git describe --long --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/glTF-Blender-Exporter"
    addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons"
    install -dm755 ${addons}/io_scene_gltf2
    install -m644 -D scripts/addons/io_scene_gltf2/*.py ${addons}/io_scene_gltf2
}
