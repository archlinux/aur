# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Ilya Gulya <ilyagulya@gmail.com>

pkgname="deezer"
pkgver=7.1.250
pkgrel=1

# Keep this in sync with the formatter version used by aunetx/deezer-linux.
# The upstream patches are easier to apply when the extracted Deezer JS/HTML
# has been formatted with the same Prettier version.
_prettier_ver=3.5.3

# Runtime MPRIS helper injected into the Electron app.
_mpris_ver=2.1.5

# Commit hash for aunetx/deezer-linux patches.
# Pinning the commit keeps the patch contents reproducible.
_patch_commit=637353333e63aa120c1d29a73124449611afa53a

pkgdesc="A proprietary music streaming service"
arch=('any')
url="https://www.deezer.com/"
license=('custom')
depends=('electron41' 'hicolor-icon-theme' 'xdg-utils')
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

sha256sums=('8895cac9a80246c2534efb30aaf4bfac73a9ee23056c250da2726cd6a9b324de'
            'c33b398d8ae279a620cf2914c806f7ee00c47519e4f404874cfd90a68fc8d80f'
            '3a23339b7b00d5d6d59768699f585d2565fc1cd7d2c43a254206de3840546eb6'
            '951c80c9dc4848b31a5fcc9655b005f3a218b1ff735396168c13922ac658c83b'
            'fe9bab50ef433516105ed2f2c349736c0be87c2f75f8d18bf1f011b2115019c1'
            '14841de7b71a93123d22997db22d088debb13976778d869e3622199108e85b4b'
            'c08a3e4550f216423ff6ebcb11f5af7268065efb5580b74e370aa40b9919cdb6'
            'b8acd7522c20212e725db4116e666b97822a835028c7e208f3fac39d4b4b1868'
            '181016c614fc62595d604d336cdb43c40645d7cc66a35acaf562c9af26177a6e'
            '4a8bc8187e69f388e202507608e1fd9c41e15ad827d7bd98c57349c531106f00'
            '171fd58d2eed2ea90ae0a50e867625203c9042e65ab9c9ce07c5e3ad3e6754bb'
            'd0c246522cdf5c253f7a0583097337ef8c03c558b129f28d4fe29ee26eaacb01'
            '2fe0cc68f05cf9655183766644ce5e81c59990d6ff6fcadbd295291f3f7c5421'
            '16f555b4bc79117f82b7735b7c25ef87b336805e1c77325fddd4fcbac380ab58'
            'f0415fa2c62140d971285dce56c8faabfa3fc79d97e72460efa5ce0ae2b8f3ec'
            'f8af7fe9b406b945f23e3a52b68ac5e9d04ecfef99930c20c591daa01766c2b2'
            '707579ffc8d413099e1976b8210fa41722590780f92a5df01e5c23b6405c5ece'
            '9e21290520323503d2e02788ba4bfb85fd44613e4d500ff7943aaab26c41a002'
            '100cf38e92898afbc332f1be1be25f19d515ea4cbcbfbfeb88444b53abb4a568'
            '593eaa17fae1360ebd2ace36c4760ac7ef8bb6696db9e1d70983d916f5c69f6e'
            'e5297d5f6eb0cd159b63afb363a98080ed32da20f151ec347407dfbd8bbdbe43'
            '02f8fb4b8101d7a856cdd82ef17a54bb4de02adcc1de89c5ec7d8bfd9293d65d'
            'e4f23d9a77bf0682ad3d1e20c4e98e68ae42d12110f9088496c85ef5c9e7cb9d'
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
