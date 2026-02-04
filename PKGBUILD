# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>
# Split package: Meta package + additional Nerd Fonts not in official repos

pkgbase=ttf-nerd-fonts-meta
pkgname=(
    'ttf-nerd-fonts-meta'
    'otf-departure-mono-nerd'
    'ttf-ubuntusans-nerd'
)
pkgver=3.4.0
pkgrel=1
arch=('any')
url="https://www.nerdfonts.com/"
license=('OFL-1.1')
options=('!strip')

_urlbase="https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}"
source=(
    "${_urlbase}/DepartureMono.zip"
    "${_urlbase}/UbuntuSans.zip"
)
sha256sums=(
    'e186890efcae31b72e9f2abc860360123ec1b3ae03bc79bb2a9fec388ebade8a'
    '1166e2666da3ee4f044e32dd1dfc08da7f9ddaa6989fc1b0cbc18a78479434d7'
)

package_ttf-nerd-fonts-meta() {
    pkgdesc="Meta package for all TTF Nerd Fonts from the official Arch repositories"
    license=('MIT' 'OFL-1.1' 'Apache-2.0')
    depends=(
        # Nerd Font Symbols (required for icon support)
        'ttf-nerd-fonts-symbols'
        'ttf-nerd-fonts-symbols-mono'

        # All TTF Nerd Fonts from official repos (alphabetical)
        'ttf-0xproto-nerd'
        'ttf-3270-nerd'
        'ttf-agave-nerd'
        'ttf-anonymouspro-nerd'
        'ttf-arimo-nerd'
        'ttf-bigblueterminal-nerd'
        'ttf-bitstream-vera-mono-nerd'
        'ttf-cascadia-code-nerd'
        'ttf-cascadia-mono-nerd'
        'ttf-cousine-nerd'
        'ttf-d2coding-nerd'
        'ttf-daddytime-mono-nerd'
        'ttf-dejavu-nerd'
        'ttf-envycoder-nerd'
        'ttf-fantasque-nerd'
        'ttf-firacode-nerd'
        'ttf-go-nerd'
        'ttf-gohu-nerd'
        'ttf-hack-nerd'
        'ttf-heavydata-nerd'
        'ttf-iawriter-nerd'
        'ttf-ibmplex-mono-nerd'
        'ttf-inconsolata-go-nerd'
        'ttf-inconsolata-lgc-nerd'
        'ttf-inconsolata-nerd'
        'ttf-intone-nerd'
        'ttf-iosevka-nerd'
        'ttf-iosevkaterm-nerd'
        'ttf-iosevkatermslab-nerd'
        'ttf-jetbrains-mono-nerd'
        'ttf-lekton-nerd'
        'ttf-liberation-mono-nerd'
        'ttf-lilex-nerd'
        'ttf-martian-mono-nerd'
        'ttf-meslo-nerd'
        'ttf-monofur-nerd'
        'ttf-monoid-nerd'
        'ttf-mononoki-nerd'
        'ttf-mplus-nerd'
        'ttf-noto-nerd'
        'ttf-profont-nerd'
        'ttf-proggyclean-nerd'
        'ttf-recursive-nerd'
        'ttf-roboto-mono-nerd'
        'ttf-sharetech-mono-nerd'
        'ttf-sourcecodepro-nerd'
        'ttf-space-mono-nerd'
        'ttf-terminus-nerd'
        'ttf-tinos-nerd'
        'ttf-ubuntu-mono-nerd'
        'ttf-ubuntu-nerd'
        'ttf-victor-mono-nerd'
        'ttf-zed-mono-nerd'
    )
    optdepends=(
        # OTF variants from official repos (for users who prefer OpenType)
        'otf-aurulent-nerd: Aurulent Sans Mono (OTF variant)'
        'otf-codenewroman-nerd: Code New Roman (OTF variant)'
        'otf-comicshanns-nerd: Comic Sans/Comic Shanns (OTF variant)'
        'otf-commit-mono-nerd: Commit Mono (OTF variant)'
        'otf-droid-nerd: Droid Sans Mono (OTF variant)'
        'otf-firamono-nerd: Fira Mono (OTF variant)'
        'otf-geist-mono-nerd: Geist Mono (OTF variant)'
        'otf-hasklig-nerd: Hasklig/Hasklug (OTF variant)'
        'otf-hermit-nerd: Hermit (OTF variant)'
        'otf-monaspace-nerd: Monaspace/Monaspice (OTF variant)'
        'otf-opendyslexic-nerd: OpenDyslexic (OTF variant)'
        'otf-overpass-nerd: Overpass (OTF variant)'

        # Additional nerd fonts from this split package
        'otf-departure-mono-nerd: Departure Mono patched with Nerd Fonts (OTF only)'
        'ttf-ubuntusans-nerd: Ubuntu Sans patched with Nerd Fonts'

        # AUR packages that provide additional nerd fonts not in official repos
        'ttf-adwaita-mono-nerd: Adwaita Mono patched with Nerd Fonts (AUR)'
        'nerd-fonts-sf-mono: SF Mono patched with Nerd Fonts (AUR)'
        'nerd-fonts-inter: Inter patched with Nerd Fonts (AUR)'
        'ttf-sarasa-gothic-nerd-fonts: Sarasa Gothic with Nerd Fonts (AUR)'
    )
    provides=('nerd-fonts-complete' 'ttf-nerd-fonts-complete')
    conflicts=('nerd-fonts-git' 'nerd-fonts-complete')

    # Meta package - nothing to install
    # All fonts are pulled in via dependencies from official repos
}

package_otf-departure-mono-nerd() {
    pkgdesc="Patched font Departure Mono from nerd fonts library"
    license=('OFL-1.1')
    provides=('otf-font-nerd')
    conflicts=('otf-departuremono-nerd')

    install -dm755 "${pkgdir}/usr/share/fonts/OTF"
    install -m644 "${srcdir}"/DepartureMonoNerdFont-Regular.otf "${pkgdir}/usr/share/fonts/OTF/"
    install -m644 "${srcdir}"/DepartureMonoNerdFontMono-Regular.otf "${pkgdir}/usr/share/fonts/OTF/"
    install -m644 "${srcdir}"/DepartureMonoNerdFontPropo-Regular.otf "${pkgdir}/usr/share/fonts/OTF/"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_ttf-ubuntusans-nerd() {
    pkgdesc="Patched font Ubuntu Sans from nerd fonts library"
    license=('custom:UFL')
    provides=('ttf-font-nerd')
    conflicts=('ttf-ubuntu-sans-nerd')

    install -dm755 "${pkgdir}/usr/share/fonts/TTF"
    install -m644 "${srcdir}"/UbuntuSansNerdFont*.ttf "${pkgdir}/usr/share/fonts/TTF/"
    install -m644 "${srcdir}"/UbuntuSansMonoNerdFont*.ttf "${pkgdir}/usr/share/fonts/TTF/"
    install -m644 "${srcdir}"/UbuntuSansNerdFontPropo*.ttf "${pkgdir}/usr/share/fonts/TTF/"
    install -m644 "${srcdir}"/UbuntuSansMonoNerdFontMono*.ttf "${pkgdir}/usr/share/fonts/TTF/"
    install -m644 "${srcdir}"/UbuntuSansMonoNerdFontPropo*.ttf "${pkgdir}/usr/share/fonts/TTF/"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "${srcdir}/LICENCE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
