# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Ilya Gulya <ilyagulya@gmail.com>

pkgname="deezer"
pkgver=7.1.300
pkgrel=2

# Keep this in sync with the formatter version used by aunetx/deezer-linux.
# The upstream patches are easier to apply when the extracted Deezer JS/HTML
# has been formatted with the same Prettier version.
_prettier_ver=3.5.3

# Runtime MPRIS helper injected into the Electron app.
_mpris_ver=2.2.3

# Commit hash for aunetx/deezer-linux patches.
# Pinning the commit keeps the patch contents reproducible.
_patch_commit=95b02d57381c4e55fedb0bf14066ff9edd7962ee

pkgdesc="A proprietary music streaming service"
arch=('any')
url="https://www.deezer.com/"
license=('custom')
depends=('electron42' 'hicolor-icon-theme' 'xdg-utils')
provides=('deezer')
makedepends=('7zip' 'asar' 'imagemagick' 'npm')

source=(
    "$pkgname-$pkgver-setup.exe::https://www.deezer.com/desktop/download/artifact-win32-x86-$pkgver"
    "$pkgname-desktop.desktop"
    "deezer-desktop"
    "prettierrc.json"
    "LICENSE"

    # Download the exact Prettier tarball
    "prettier-${_prettier_ver}.tgz::https://registry.npmjs.org/prettier/-/prettier-${_prettier_ver}.tgz"

    # Locked npm project for the MPRIS dependency tree.
    "mpris-package.json"
    "mpris-package-lock.json"
    "mpris-service-${_mpris_ver}.tgz::https://registry.npmjs.org/@jellybrick/mpris-service/-/mpris-service-${_mpris_ver}.tgz"

    # Upstream patches from aunetx/deezer-linux.
    "01-start-in-tray-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/01-start-in-tray.patch"
    "02-start-without-tray-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/02-start-without-tray.patch"
    "03-disable-auto-updater-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/03-disable-auto-updater.patch"
    "04-remove-os-information-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/04-remove-os-information.patch"
    "05-provide-metadata-mpris-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/05-provide-metadata-mpris.patch"
    "06-control-log-level-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/06-control-log-level.patch"
    "07-improve-responsiveness-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/07-improve-responsiveness.patch"
    "08-hide-offline-banner-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/08-hide-offline-banner.patch"
    "09-disable-animations-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/09-disable-animations.patch"
    "10-disable-notifications-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/10-disable-notifications.patch"
    "11-fix-thumbar-actions-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/11-fix-thumbar-actions.patch"
    "12-adjust-volume-on-wheel-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/12-adjust-volume-on-wheel.patch"
    "13-disable-hardware-acceleration-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/13-disable-hardware-acceleration.patch"
    "15-sync-theme-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/15-sync-theme.patch"

    # Local patches
    "99-systray-icon.patch"
)

noextract=(
    "prettier-${_prettier_ver}.tgz"
    "mpris-service-${_mpris_ver}.tgz"
)

sha256sums=('9bccf2bc2a08a778feadea0db03a4194a62b9c63d4517ae6e46bc94d8236467b'
            'c33b398d8ae279a620cf2914c806f7ee00c47519e4f404874cfd90a68fc8d80f'
            '2712df28c1c061988ef75bfa543532ce16def27252b572d72ba3944a9788ac2c'
            '951c80c9dc4848b31a5fcc9655b005f3a218b1ff735396168c13922ac658c83b'
            'fe9bab50ef433516105ed2f2c349736c0be87c2f75f8d18bf1f011b2115019c1'
            '14841de7b71a93123d22997db22d088debb13976778d869e3622199108e85b4b'
            '1c2449ab478c99ad8b5f6ba545eeb778d279f20a72e64bd6694485c7766d1876'
            'c18f6d106d5a9320b520c441c5d232ff8f8ce61a98babfd1eb29378e8b68f803'
            '20c3254c49975b05fe76b6ef650c9db93c5f028ac9e9c9e62c89762acc7076d0'
            '655681a094721af8fba69b729b8276ee345e5aac99239726c3e53039b0811cef'
            'd1d2914e4bc9826acd139108ff2010eb3dc51154e35079612bacbf77a8a1d326'
            'f07df06e56552116ad15bb8ee1c01dede0947dcfeb763a0ddeb8d87732c37f40'
            '37ba808250e59821b5265a4900c56820e40e2b7ebb295fcac05375eca0daee5b'
            'd1651ab48109a512fd63c5dab43812bbf3d08d9ff81ddae4ed0ec1cfa9d1d31e'
            'a88886df73b38a23fd8fac931cad86f7b7d6fb4b51697ba236311869ab09180d'
            '56a745ec9ab1ba86c8f5dfbba65195fc143e29a6bf28f040034867ee9a8e2154'
            'b85d40aab533f29cc74d4869363ad4c2bf610d9663e6c48ffcc774542bf70349'
            '4f59009fac59a740fd053edd6e68c881db97e270430c4be9de19c389908b8545'
            '2095217bee000f1950d39a7592831fb2640e7f8f7d0c5eff14baa87960072dfe'
            'a1b13d97b8618e7fb9d3a3376b2cf59aea5260b0fb429fce8fb20b1ead977304'
            'f3d9a4b13f639260b4147dfe94694ab29448aa254d65748b4f20129d10fe4fb7'
            '22f55ee12eb4c4d678eabc91d4e6520a9c0381560a74cc51f097ddce8b317673'
            'bf033d4448546d730db7f19519518e8d6f7fd3498c71d02825ae21e96a798441'
            '2362c52147cf67759388ba6685e2add32c5bcfcdbdbca8e0990f58cafa0392de')

_setup_prettier() {
    # Extract the prettier tarball into a stable location.
    rm -rf "$srcdir/prettier"
    mkdir -p "$srcdir/prettier"

    bsdtar -xzf "$srcdir/prettier-${_prettier_ver}.tgz" \
        -C "$srcdir/prettier" \
        --strip-components=1
}

_prettier() {
    # Wrapper around the pinned Prettier CLI.
    node "$srcdir/prettier/bin/prettier.cjs" "$@"
}

_setup_mpris() {
    # Install MPRIS support from a locked npm dependency tree.
    #
    # mpris-service itself is downloaded through source=() and verified by
    # sha256sums. The lockfile pins all transitive dependency versions and npm
    # integrity hashes.
    rm -rf "$srcdir/mpris-vendor"
    mkdir -p "$srcdir/mpris-vendor"

    cp "$srcdir/mpris-package.json" "$srcdir/mpris-vendor/package.json"
    cp "$srcdir/mpris-package-lock.json" "$srcdir/mpris-vendor/package-lock.json"
    cp "$srcdir/mpris-service-${_mpris_ver}.tgz" "$srcdir/mpris-vendor/"

    npm ci \
        --prefix "$srcdir/mpris-vendor" \
        --cache "$srcdir/npm-cache" \
        --omit=dev \
        --no-audit \
        --no-fund \
        --ignore-scripts

    mkdir -p "$srcdir/resources/app/node_modules"
    cp -a "$srcdir/mpris-vendor/node_modules/." "$srcdir/resources/app/node_modules/"
}

prepare() {
    # Extract the Electron app payload from Deezer's Windows installer.
    7z x -so "$pkgname-$pkgver-setup.exe" "\$PLUGINSDIR/app-32.7z" > app-32.7z

    # Extract the app archive so resources/app.asar can be modified.
    7z x -y -bsp0 -bso0 app-32.7z

    # Extract PNG icons from Deezer's Windows .ico file.
    magick resources/win/app.ico resources/win/deezer-%d.png

    # Set up the exact Prettier version used to normalize Deezer's JS/HTML
    # before applying aunetx/deezer-linux patches.
    _setup_prettier

    cd resources/

    # Unpack Electron's asar bundle so we can patch the app contents.
    asar extract app.asar app

    cd "$srcdir/resources/app"
    mkdir -p resources/linux/

    # Generate small tray icons.
    for size in 24 48; do
        magick "$srcdir/resources/win/deezer-8.png" -resize "${size}x${size}" -strip \
            -define png:compression-filter=5 -define png:compression-level=9 \
            "resources/linux/systray-${size}.png"
    done

    # Use the project-specific Prettier config so the generated formatting
    # matches what the upstream patches expect.
    cp "$srcdir/prettierrc.json" .prettierrc
    _prettier --write "build/*.{js,html}"

    # Apply every patch listed in source=().
    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"

        [[ $src = *.patch ]] || continue

        echo "Applying patch ${src}..."
        patch -Np1 -l -F3 < "${srcdir}/${src}"
    done

    # Add MPRIS runtime dependencies to the unpacked app.
    _setup_mpris

    cd "$srcdir/resources/"

    # Repack the modified Electron app.
    asar pack app app.asar
}

package() {
    mkdir -p "$pkgdir/usr/share/deezer"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/bin/"

    for size in 16 22 24 32 48 64 128 256 512; do
        install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"

        magick resources/win/deezer-8.png -resize "${size}x${size}" -strip \
            -define png:compression-filter=5 -define png:compression-level=9 \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/deezer-desktop.png"

        chmod 644 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/deezer-desktop.png"
    done

    install -Dm644 resources/app.asar "$pkgdir/usr/share/deezer/app.asar"
    install -Dm644 "$pkgname-desktop.desktop" "$pkgdir/usr/share/applications/$pkgname-desktop.desktop"
    install -Dm755 deezer-desktop "$pkgdir/usr/bin/deezer-desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
