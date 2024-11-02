# Maintainer: envolution
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Sosthène Guédon <sosthene+aur@guedon.gdn>

pkgname=superflu-riteurnz
_altpkgname=superfluous-returnz
pkgver=1.6.0
pkgrel=1
pkgdesc="Artisanal point and click game - full version"
arch=('any')
url="https://studios.ptilouk.net/superflu-riteurnz/floss/"
license=('GPL3')
depends=('libyaml' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'hicolor-icon-theme')
options=(!strip !debug)
source=(https://asso.framasoft.org/dolo/h/7raZBvcqNq0)
sha256sums=('db7b805037e07c41dfea7066b0dc47ef9baf0ba5123122680202495fb5a84aa7')

package() {
    cd "${srcdir}/superfluous-returnz-1.6.0-d13-public/"
    
    # Create binary directory and install binary
    install -Dm755 "bin64/${_altpkgname}" "${pkgdir}/usr/bin/${_altpkgname}"
    
    # Install icon and desktop file
    install -Dm644 "share/icons/${_altpkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_altpkgname}.svg"
    install -Dm644 "share/applications/${_altpkgname}.desktop" "${pkgdir}/usr/share/applications/${_altpkgname}.desktop"
    
    # Create and install data directory contents
    mkdir -p "${pkgdir}/usr/share/${_altpkgname}"
    cp -r "share/${_altpkgname}"/* "${pkgdir}/usr/share/${_altpkgname}/"
    
    # Install license
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_altpkgname}/LICENSE.md"
}
