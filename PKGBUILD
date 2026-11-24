# rootapp-bin
pkgname=rootapp-bin
pkgver=0.9.167
pkgrel=1
pkgdesc="Root App is a new Discord alternative, designed for gaming communities and large online groups"
arch=('x86_64')
url="https://www.rootapp.com"
license=('LicenseRef-proprietary')
depends=('alsa-lib'
         'at-spi2-core'
         'ca-certificates-mozilla'
         'cairo'
         'dbus'
         'expat'
         'fontconfig'
         'gdk-pixbuf2'
         'glib2'
         'gtk3'
         'hicolor-icon-theme'
         'krb5'
         'libcups'
         'libgcc'
         'libglvnd'
         'libice'
         'libpipewire'
         'libpulse'
         'libsm'
         'libstdc++'
         'libva'
         'libx11'
         'libxcb'
         'libxcomposite'
         'libxcursor'
         'libxdamage'
         'libxext'
         'libxfixes'
         'libxi'
         'libxinerama'
         'libxkbcommon'
         'libxrandr'
         'libxss'
         'libxt'
         'libxtst'
         'mesa'
         'nspr'
         'nss'
         'openssl-3'
         'pango'
         'pciutils'
         'systemd-libs'
         'vulkan-icd-loader'
         'wayland'
         'xdg-utils')
provides=('rootapp')
conflicts=('rootapp')
optdepends=('bluez: org.bluez Bluetooth service (bluetooth.service) for Web Bluetooth peripherals'
            'cups: org.cups.cupsd printing service (socket-activated cups.socket) for the Chromium portal Print interface and the libcups.so.2 client'
            'xdg-desktop-portal: file-picker and screen-share dialogs'
            'xdg-desktop-portal-gnome: file-picker, settings and screen-share backend on GNOME'
            'xdg-desktop-portal-gtk: file-picker and settings backend on GTK desktops'
            'xdg-desktop-portal-kde: file-picker and screen-share backend on KDE Plasma'
            'xdg-desktop-portal-wlr: screen-share backend on wlroots compositors'
            'xdg-desktop-portal-hyprland: window and region screen share backend on Hyprland (the app registers global hotkeys through X11 XRecord in libuiohook, so they stay unavailable on Wayland)'
            'xdg-desktop-portal-cosmic: xdg-desktop-portal backend on the COSMIC desktop environment'
            'xdg-desktop-portal-dde: xdg-desktop-portal backend on the Deepin desktop environment'
            'xdg-desktop-portal-lxqt: xdg-desktop-portal backend using Qt, KDE Frameworks and libfm-qt'
            'xdg-desktop-portal-pantheon: xdg-desktop-portal backend on Pantheon'
            'xdg-desktop-portal-phosh: xdg-desktop-portal backend using GTK, GNOME and Phosh'
            'xdg-desktop-portal-wlcom: xdg-desktop-portal backend for the Kylin Wayland compositor'
            'xdg-desktop-portal-xapp: xdg-desktop-portal backend using GTK and Cinnamon, MATE and Xfce4 infrastructure'
            'pipewire: PipeWire daemon that feeds the portal ScreenCast capture'
            'wireplumber: PipeWire session and policy manager for voice and audio devices'
            'pipewire-pulse: PulseAudio-compatible server for voice and audio devices'
            'pipewire-alsa: ALSA client bridge to the PipeWire audio server for voice and audio devices'
            'dunst: org.freedesktop.Notifications daemon for sessions without one'
            'upower: org.freedesktop.UPower service for the Chromium battery-status API (org.freedesktop.UPower.Device IsPresent/Percentage)'
            'gnome-keyring: org.freedesktop.secrets service for session-token and password storage on GNOME and GTK desktops'
            'gnome-shell-extension-appindicator: org.kde.StatusNotifierItem tray host on GNOME'
            'plasma-desktop: org.kde.StatusNotifierWatcher tray host on KDE Plasma'
            'fcitx5: org.fcitx.Fcitx input-method service for Avalonia D-Bus IME on Fcitx (alternative to ibus)'
            'ibus: org.freedesktop.IBus.InputContext/Portal/Service input-method service probed by the payload (Avalonia IME); Arch ships it as ibus'
            'kwallet: Plasma 6 secret storage (ksecretd) and kwalletd6 wallet for session-token and password storage on KDE Plasma'
            'snixembed: StatusNotifierItem-to-XEmbed bridge for trays on minimal X11 sessions'
            'waybar: org.kde.StatusNotifierWatcher tray host on wlroots compositors'
            'speech-dispatcher: text-to-speech service for the Chromium libspeechd.so.2 probe (pulls libspeechd)'
            'libvlc: LibVLC runtime for the Root player (P/Invoke module libvlc, resolved through /usr/lib/libvlc.so)'
            'vlc-plugin-ffmpeg: video and stream codecs for LibVLC playback (pulls libvlc)'
            'vlc-plugin-pulse: audio output for LibVLC playback on PipeWire and PulseAudio (pulls libvlc)'
            'curl: crash report uploads for the bundled Chromium crash handler (chrome_crashpad_handler dlopens libcurl.so.4)'
            'nvidia-utils: hardware video decode/encode on NVIDIA GPUs (provides libcuda.so.1, libnvcuvid.so.1, libnvidia-encode.so.1, libGLX_nvidia.so.0)'
            'intel-media-driver: Intel VA-API driver (iHD_drv_video.so) for hardware video decode in the bundled Chromium on Broadwell and newer'
            'libva-intel-driver: legacy Intel VA-API driver (i965_drv_video.so) for hardware video decode on Haswell and older'
            'libva-nvidia-driver: VA-API frontend for NVIDIA NVDEC (nvidia_drv_video.so) used by the bundled Chromium on NVIDIA GPUs'
            'vulkan-intel: Intel GPU Vulkan driver and ICD (provides libvulkan_intel.so probed by the bundled Chromium GPU process)'
            'vulkan-radeon: AMD GPU Vulkan driver and ICD (provides libvulkan_radeon.so probed by the bundled Chromium GPU process)'
            'vulkan-swrast: lavapipe software Vulkan ICD (provides libvulkan_lvp.so probed by the bundled Chromium GPU process; Mesa ships no ICD by default)'
            'vulkan-mesa-implicit-layers: Mesa implicit Vulkan layers (libVkLayer_MESA_device_select.so, libVkLayer_MESA_anti_lag.so) probed by the bundled Chromium GPU process; picks the right GPU on hybrid/multi-GPU systems')
options=('!strip' '!debug')

source=("Root-${pkgver}-x86_64.AppImage::https://installer.rootapp.com/installer/Linux/X64/Root.AppImage")
sha256sums=('90069e784079a903640985f41113ba208a410f30aec6dad5237d58a62d4cbcd8')
prepare() {
    chmod +x "${srcdir}/Root-${pkgver}-x86_64.AppImage"
    "${srcdir}/Root-${pkgver}-x86_64.AppImage" --appimage-extract
    chmod go-w squashfs-root

    shipped=$(sed -n 's/^X-AppImage-Version=//p' "${srcdir}"/squashfs-root/*.desktop | head -n 1)
    if [ "$shipped" != "$pkgver" ]; then
        printf 'payload is version %s, pkgver is %s\n' "${shipped:-unknown}" "$pkgver" >&2
        return 1
    fi
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}/"
    chmod 755 "${pkgdir}/opt/${pkgname}/AppRun"

    rm -f "${pkgdir}/opt/${pkgname}/usr/bin/Root.dbg"
    rm -f "${pkgdir}/opt/${pkgname}/usr/bin/UpdateNix"

    if [ ! -x "${pkgdir}/opt/${pkgname}/usr/bin/Root" ]; then
        printf 'payload has no executable usr/bin/Root, the wrapper would exec nothing\n' >&2
        return 1
    fi

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/rootapp" <<'WRAPPER_EOF'
#!/bin/sh
set -eu
run="${XDG_DATA_HOME:-$HOME/.local/share}/rootapp-bin"
stamp=__STAMP__
mkdir -p "$run"
chmod 700 "$run" 2>/dev/null || true
if [ "$(cat "$run/.stamp" 2>/dev/null || true)" != "$stamp" ] || [ ! -x "$run/Root" ]; then
    cp --reflink=auto "/opt/rootapp-bin/usr/bin/Root" "$run/Root.part"
    chmod 755 "$run/Root.part"
    mv -f "$run/Root.part" "$run/Root"
    for entry in /opt/rootapp-bin/usr/bin/*; do
        name=${entry##*/}
        [ "$name" = Root ] || ln -sfn "$entry" "$run/$name"
    done
    printf '%s\n' "$stamp" > "$run/.stamp"
fi
exec "$run/Root" "$@"
WRAPPER_EOF
    sed -i "s/__STAMP__/${pkgver}-${pkgrel}/" "${pkgdir}/usr/bin/rootapp"
    if grep -q '__STAMP__' "${pkgdir}/usr/bin/rootapp"; then
        printf 'unstamped wrapper would recopy the payload on every launch\n' >&2
        return 1
    fi
    chmod 755 "${pkgdir}/usr/bin/rootapp"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Copyright 2026 RootApp

The Root desktop application is proprietary software. Redistribution of the
application itself is not permitted; this package repacks the upstream binary
for installation convenience.

Upstream: https://www.rootapp.com
EOF

    install -Dm644 "${srcdir}/squashfs-root/Root.png" "${pkgdir}/usr/share/pixmaps/rootapp.png"
    install -Dm644 "${srcdir}/squashfs-root/Root.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/rootapp.png"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/rootapp-app.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Root
Comment=Root App is a new Discord alternative, designed for gaming communities and large online groups
Exec=rootapp %U
Icon=rootapp
Terminal=false
StartupWMClass=Root
Categories=Network;InstantMessaging;
MimeType=x-scheme-handler/rootapp;
EOF
}
