# Maintainer: Ivan Vatlin <jenrus+aur at riseup dot net>

pkgname=('i915-vfe-bin')
pkgver=5.10.0
pkgrel=1
url="https://patchwork.freedesktop.org/patch/395580/?series=82783&rev=1"
pkgdesc="Precompiled i915 driver patched to limit VFE threads based on GT"
license=('MIT')
arch=('x86_64')
source=("https://github.com/jeffangelion/i915-vfe/releases/download/${pkgver}/i915.ko.tar.gz")
sha1sums=('60e6b71d0c3bdd96c4f627b10dc6806b77bfe54b')
install=${pkgname}.install

package(){
    install -Dm644 "${srcdir}/i915.ko" "${pkgdir}$(find /usr/lib/modules/ -name "extramodules-$(echo ${pkgver} | awk -F. '{print $1"."$2}')*")/gpu/drm/i915/i915.ko"
}
