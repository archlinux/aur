# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Ilya Gulya <ilyagulya@gmail.com>

pkgname="deezer"
pkgver=8.0.10
pkgrel=1

# Keep this in sync with the formatter version used by aunetx/deezer-linux.
# The upstream patches are easier to apply when the extracted Deezer JS/HTML
# has been formatted with the same Prettier version.
_prettier_ver=3.5.3
_mpris_ver=2.2.3

# Commit hash for aunetx/deezer-linux patches.
_patch_commit=fcf1972d0c2195a78d92306b5a2ddadd1965e714

pkgdesc="A proprietary music streaming service"
arch=('any')
url="https://www.deezer.com/"
license=('LicenseRef-Deezer')
depends=('electron44' 'hicolor-icon-theme' 'xdg-utils')
provides=('deezer')
makedepends=('7zip' 'asar' 'imagemagick' 'nodejs' 'npm')

source=(
    "$pkgname-$pkgver-setup.exe::https://www.deezer.com/desktop/download/artifact-win32-x86-$pkgver"
    "$pkgname-desktop.desktop"
    "deezer-desktop"
    "prettierrc.json"
    "LICENSE"

    # Download the exact Prettier tarball
    "prettier-${_prettier_ver}.tgz::https://registry.npmjs.org/prettier/-/prettier-${_prettier_ver}.tgz"

    "mpris-service-${_mpris_ver}.tgz::https://registry.npmjs.org/@jellybrick/mpris-service/-/mpris-service-${_mpris_ver}.tgz"
    "mpris-package.json"
    "mpris-package-lock.json"

    # Upstream and local patches
    "01-start-in-tray-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/01-start-in-tray.patch"
    "02-start-without-tray.patch"
    "03-disable-auto-updater-${_patch_commit}.patch::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/patches/03-disable-auto-updater.patch"
    "04-remove-os-information.patch"
    "05-mpris.patch"
    "06-control-log-level.patch"
    "07-improve-responsiveness.patch"
    "08-hide-offline-banner.patch"
    "09-disable-animations.patch"
    "10-disable-notifications.patch"
    "12-adjust-volume-on-wheel.patch"
    "13-disable-hardware-acceleration.patch"
    "15-sync-theme.patch"
    "16-custom-theme.patch"
    "99-systray-icon.patch"

    # CSS themes and a template
    "everforest-${_patch_commit}.css::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/themes/everforest.css"
    "gruvbox-${_patch_commit}.css::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/themes/gruvbox.css"
    "liquid-glass-${_patch_commit}.css::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/themes/liquid-glass.css"
    "matrix-${_patch_commit}.css::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/themes/matrix.css"
    "monokai-${_patch_commit}.css::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/themes/monokai.css"
    "nord-${_patch_commit}.css::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/themes/nord.css"
    "primer-${_patch_commit}.css::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/themes/primer.css"
    "solarized-${_patch_commit}.css::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/themes/solarized.css"
    "synthwave-${_patch_commit}.css::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/themes/synthwave.css"
    "template-${_patch_commit}.css::https://raw.githubusercontent.com/aunetx/deezer-linux/${_patch_commit}/themes/template.css"
)

noextract=(
    "mpris-service-${_mpris_ver}.tgz"
    "prettier-${_prettier_ver}.tgz"
)

sha256sums=('21215c49c3b7a3720fc8dad523cb6a384f2432fa5436e4399db8478e774dd96b'
            'c33b398d8ae279a620cf2914c806f7ee00c47519e4f404874cfd90a68fc8d80f'
            'addc90b0950c9432fe4fd9e99540cedd778de531413403668cd583a91a19d5c6'
            '951c80c9dc4848b31a5fcc9655b005f3a218b1ff735396168c13922ac658c83b'
            'fe9bab50ef433516105ed2f2c349736c0be87c2f75f8d18bf1f011b2115019c1'
            '14841de7b71a93123d22997db22d088debb13976778d869e3622199108e85b4b'
            '20c3254c49975b05fe76b6ef650c9db93c5f028ac9e9c9e62c89762acc7076d0'
            '1c2449ab478c99ad8b5f6ba545eeb778d279f20a72e64bd6694485c7766d1876'
            'c18f6d106d5a9320b520c441c5d232ff8f8ce61a98babfd1eb29378e8b68f803'
            '655681a094721af8fba69b729b8276ee345e5aac99239726c3e53039b0811cef'
            'db502aaa9d9ae84bd38cdba4d96d267d97e1e0e6ef8e2249c1f62652ae6e1e3f'
            'f07df06e56552116ad15bb8ee1c01dede0947dcfeb763a0ddeb8d87732c37f40'
            '9f846bbf9c5281175150f3b7ecbcc2a027c6f4dbb4abed307c6fc39d6b19e170'
            '033387bc28413ed7d8addbaf9432f36fe14572c58983a271be31190bab4a214a'
            '7019b9bdf6311506092e53a5ca3f9c8a057e7b1a7cb3ec7013da73e25d48a141'
            '83177123ca4157887ac74d88853b2d1e5fe05c0556fdea5e30ec919ab3653db6'
            '379155a0bcb373c05797d204bffb5f8d87b65e918c5dc843b7472885b701731a'
            '310b90a12b444289957ad660e2847a5d5f41c30a4ae1a71c74553613aa4df4b3'
            '6b60356ddc47f6df04d5e449dd72a143a837ca64816d7bcd34c509bf746db0d2'
            '87e37bf204507e1cca42be071140ecc0365c156f81e306b7a9eae796f1ab4693'
            '6f73e43b0b26ccceb6ef6a9d0d7a625448898e22bea72ce43d5cf23bc766f547'
            '830c594ebac21b7fd6a27eed925b60254c3644a341a63a1f6bb908d40f1e648e'
            '3aad118f82350f009601137c7639e1ee5474b7acd83dfb8f1d5593e24b3275ea'
            'f7ce4845f52f07aea1f64057283ac4d1bc668bf22b4f6ea31f85f10625289e8e'
            '4de4113297ee8cf246db38a02fd0ded3cb7fb013843941dccf941412a6ca5b83'
            'bb83db631c8e7b8d26cb1b50c636dec07c8954e03bf360c5dd890efc53028682'
            'f8e7a73f0a61d43a13839720f0740f60ebf3be0201100c1a32ee2077b679cd12'
            'ca54c0e7cb17e9d062857c26c4236fbaa2635ea89e6ce1927726c59bac888c7a'
            '2e095ce38317246f5d2963c6831ac312e7fa4246cdad8009574f2bf38a7db3a9'
            'afe01d616e850835ef51cc526663d793fc02e95acd10b57ea119b545086440e1'
            'ed50f72a9a1f29c96734765525ad7de4dd856363ff2114afa630592bb57fac3d'
            'd43b89d339066379ace91288e8150aef1af56f812a1a91504d0703553d275a85'
            '438e8b82bfd14efd7c5910ff52d89112c468a091f20946d886b145ccd14bc35c'
            '6e71f90ad076568c56331f41bd369b35ef067e62dba1ec8790667bffeed85b00')

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
        patch --batch --forward --no-backup-if-mismatch -Np1 -l -F0 < "${srcdir}/${src}"
    done

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
    local theme
    for theme in "${source[@]}"; do
        theme="${theme%%::*}"
        [[ $theme = *.css ]] || continue
        install -Dm644 "$srcdir/$theme" \
            "$pkgdir/usr/share/deezer/themes/${theme%-${_patch_commit}.css}.css"
    done
    install -Dm644 "$pkgname-desktop.desktop" "$pkgdir/usr/share/applications/$pkgname-desktop.desktop"
    install -Dm755 deezer-desktop "$pkgdir/usr/bin/deezer-desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
