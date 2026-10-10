# Maintainer: jogai <wouter@jogai.nl>
# Design, release steps and maintenance notes: PKGBUILD.md (next to this file).
# Generated blocks are rewritten by packaging/sync-pkgbuild.py; do not edit them by hand.

pkgname=qtgmc-6ui
pkgver=0.1.0
pkgrel=1
pkgdesc="QTGMC deinterlacer for archival video (VapourSynth) with a Qt6 GUI"
arch=(x86_64)
url="https://github.com/jogai/qtgmc-6ui"
# BEGIN generated: licenses (packaging/sync-pkgbuild.py)
license=('GPL-2.0-only' 'Apache-2.0' 'GPL-2.0-or-later' 'GPL-3.0-or-later' 'LGPL-2.1-only' 'LGPL-3.0-only' 'MIT' 'WTFPL')
_extra_licenses=('zimg-1ad1895d5ff0bbe69c61243f9996aede713d1b5f.tar.gz|COPYING|resize2/zimg-COPYING'
                 'graphengine-cb5b2ce13384ec2491f0c37256ea210034799f69.tar.gz|COPYING|resize2/graphengine-COPYING'
                 'graphengine-7bb77a5c062c610e7f44df6a59155cc3ab3e452a.tar.gz|COPYING|znedi3/graphengine-COPYING'
                 'vsxx-11eb026af5517d69e1d3d6258d1b2c2040c508e7.tar.gz|COPYING.LGPLv2.1|znedi3/vsxx-COPYING.LGPLv2.1'
                 'vapoursynth-zig-344caabeae1f4168b69ea6975d6ef244583e7c63.tar.gz|LICENSE|zsmooth/vapoursynth-zig-LICENSE'
                 'adworacz-fftw-579b516e6b39a2a96200d248fc3c96d1ad7d9841.tar.gz|LICENSE|zsmooth/fftw-zig-LICENSE'
                 'fftw-3.3.11.tar.gz|COPYRIGHT|zsmooth/fftw-COPYRIGHT'
                 'vapoursynth_dfttest2_cpu-11.1.0.tar.gz|vs-dfttest2/cpu_source/vectorclass/LICENSE|dfttest2/vectorclass-LICENSE')
# END generated: licenses

# BEGIN generated: plugin-deps (packaging/sync-pkgbuild.py from packaging/plugins/plugins.json)
_plugin_set=all
_plugin_depends=(fftw libgcc libstdc++ glibc llvm22-libs zimg)
_plugin_makedepends=(cmake llvm22 make meson ninja patch zig)
# END generated: plugin-deps

# Python-level and runtime-loaded deps namcap cannot see: see PKGBUILD.md "namcap".
depends=(
  python
  vapoursynth
  vapoursynth-plugin-bestsource
  ffmpeg
  pyside6
  python-numpy
  python-psutil
  python-rich
  python-typing_extensions
  qt6-svg
  hicolor-icon-theme
  bash
  "${_plugin_depends[@]}"
)
makedepends=(
  uv
  python-build
  python-hatchling
  "${_plugin_makedepends[@]}"
)
optdepends=(
  'x264: standalone H.264 encoder for viewing copies'
  'x265: standalone HEVC encoder (incl. high bit depth) for viewing copies'
  'kvazaar: HEVC encoder for viewing copies (not available through FFmpeg)'
  'sox: high-quality audio resampling/dithering for viewing copies'
)
options=(!debug !lto)  # !lto: plugin build.sh is tested without LTO (per-ISA SIMD kernels)

_venv=/usr/lib/$pkgname/venv
_srcname=$pkgname-$pkgver

# QTGMC6UI_LOCAL_SRC: working-tree tarball instead of the release (packaging/local-build.sh)
if [[ -n ${QTGMC6UI_LOCAL_SRC:-} ]]; then
  source=("$_srcname.tar.gz::file://$QTGMC6UI_LOCAL_SRC")
else
  source=("$_srcname.tar.gz::$url/archive/v$pkgver.tar.gz")
fi
# set by sync-pkgbuild.py --project-sha256 (never updpkgsums)
_project_sha256='abaa41ae615fbe9b90b577cdfa01c8955134a6ffe83d2325e87c16e4779f62fa'
sha256sums=("$_project_sha256")

# BEGIN generated: plugin-sources (packaging/sync-pkgbuild.py from packaging/plugins/plugins.json)
source+=('akarin-v1.5.0.tar.gz::https://github.com/Jaded-Encoding-Thaumaturgy/akarin-vapoursynth-plugin/archive/refs/tags/v1.5.0.tar.gz')  # akarin
sha256sums+=('83852c90feef47510b866b8244af035af00ea6b77118b95697eef362266fcb5b')
noextract+=('akarin-v1.5.0.tar.gz')
source+=('resize2-0.5.1.tar.gz::https://github.com/Jaded-Encoding-Thaumaturgy/vapoursynth-resize2/archive/refs/tags/0.5.1.tar.gz')  # resize2
sha256sums+=('54d01057818fd0794218ab43147461f803225eeea55766073b7b9aaa3093fe00')
noextract+=('resize2-0.5.1.tar.gz')
source+=('zimg-1ad1895d5ff0bbe69c61243f9996aede713d1b5f.tar.gz::https://github.com/sekrit-twc/zimg/archive/1ad1895d5ff0bbe69c61243f9996aede713d1b5f.tar.gz')  # resize2
sha256sums+=('264e545f54c8ed564e00ea11865b7e4391563a297dbd3935c611c24a8eee9a46')
noextract+=('zimg-1ad1895d5ff0bbe69c61243f9996aede713d1b5f.tar.gz')
source+=('graphengine-cb5b2ce13384ec2491f0c37256ea210034799f69.tar.gz::https://github.com/sekrit-twc/graphengine/archive/cb5b2ce13384ec2491f0c37256ea210034799f69.tar.gz')  # resize2
sha256sums+=('663bc958094280e3dabfa76a408296a51f5222f56115fd7782eae737edeaa179')
noextract+=('graphengine-cb5b2ce13384ec2491f0c37256ea210034799f69.tar.gz')
source+=('mvutensils-v9.tar.gz::https://github.com/myrsloik/mvutensils/archive/refs/tags/v9.tar.gz')  # mvutensils
sha256sums+=('5b4fa7dc6e6278c3bd2acd15be222e253e47c30cfa898619c2a02effd6de7dff')
noextract+=('mvutensils-v9.tar.gz')
source+=('znedi3-r3.3.tar.gz::https://github.com/sekrit-twc/znedi3/archive/refs/tags/r3.3.tar.gz')  # znedi3
sha256sums+=('206ac0e98f6152a7dc852e004c00c4294900deea77a6b53102e6e5d50e78f77c')
noextract+=('znedi3-r3.3.tar.gz')
source+=('graphengine-7bb77a5c062c610e7f44df6a59155cc3ab3e452a.tar.gz::https://github.com/sekrit-twc/graphengine/archive/7bb77a5c062c610e7f44df6a59155cc3ab3e452a.tar.gz')  # znedi3
sha256sums+=('8a73a9ee1cbb2e62e182b0501365d71969165157e8ef6308cf76e2e053e44102')
noextract+=('graphengine-7bb77a5c062c610e7f44df6a59155cc3ab3e452a.tar.gz')
source+=('vsxx-11eb026af5517d69e1d3d6258d1b2c2040c508e7.tar.gz::https://github.com/sekrit-twc/vsxx/archive/11eb026af5517d69e1d3d6258d1b2c2040c508e7.tar.gz')  # znedi3
sha256sums+=('2f0a453543b62386ef6050d56d12a991507d733f15aae0b5e1930ac4bcb2f0e7')
noextract+=('vsxx-11eb026af5517d69e1d3d6258d1b2c2040c508e7.tar.gz')
source+=('zsmooth-0.20.0.tar.gz::https://github.com/adworacz/zsmooth/archive/refs/tags/0.20.0.tar.gz')  # zsmooth
sha256sums+=('218d141fe0b0e1cac2c6a16f2d653dd2fb4ea6f0b8d0792232dbbe2107469600')
noextract+=('zsmooth-0.20.0.tar.gz')
source+=('vapoursynth-zig-344caabeae1f4168b69ea6975d6ef244583e7c63.tar.gz::https://github.com/dnjulek/vapoursynth-zig/archive/344caabeae1f4168b69ea6975d6ef244583e7c63.tar.gz')  # zsmooth
sha256sums+=('385dd211a8e98d0cfd78199d5e1cb93ff442558d4fec789aef247310ca974689')
noextract+=('vapoursynth-zig-344caabeae1f4168b69ea6975d6ef244583e7c63.tar.gz')
source+=('adworacz-fftw-579b516e6b39a2a96200d248fc3c96d1ad7d9841.tar.gz::https://github.com/adworacz/fftw/archive/579b516e6b39a2a96200d248fc3c96d1ad7d9841.tar.gz')  # zsmooth
sha256sums+=('b92b046271bacec5d2015bc6fd1e5425b23479d295dc26dfa08615c1598f28b9')
noextract+=('adworacz-fftw-579b516e6b39a2a96200d248fc3c96d1ad7d9841.tar.gz')
source+=('fftw-3.3.11.tar.gz::https://www.fftw.org/fftw-3.3.11.tar.gz')  # zsmooth
sha256sums+=('5630c24cdeb33b131612f7eb4b1a9934234754f9f388ff8617458d0be6f239a1')
noextract+=('fftw-3.3.11.tar.gz')
source+=('vapoursynth_dfttest2_cpu-11.1.0.tar.gz::https://files.pythonhosted.org/packages/13/a6/ab2b5ff13a13584fd46133711747646a525e80fea7703b1c4a4021870976/vapoursynth_dfttest2_cpu-11.1.0.tar.gz')  # dfttest2
sha256sums+=('656b91c77b097ac521de89d216be34cea94164c2c7cb51c6baad149981859c49')
noextract+=('vapoursynth_dfttest2_cpu-11.1.0.tar.gz')
source+=('dfttest2-11.0.0-py3-none-any.whl::https://files.pythonhosted.org/packages/cc/97/861b986073c4a44d32d045878c762f13cad76609b6bef8b336faeed688de/dfttest2-11.0.0-py3-none-any.whl')  # dfttest2
sha256sums+=('869067bb309a8ffb4f5c5b8fe6a96cca164ac59879502ef4cb029505f8b7e4cc')
noextract+=('dfttest2-11.0.0-py3-none-any.whl')
# END generated: plugin-sources

# BEGIN generated: python (packaging/sync-pkgbuild.py from uv.lock)
source+=('jetpytools-3.1.2-py3-none-any.whl::https://files.pythonhosted.org/packages/2f/f5/501254ac5e0c01e3755b480e9d0c96bd654c6fc408ec8adcd950da4b728d/jetpytools-3.1.2-py3-none-any.whl')  # jetpytools 3.1.2
sha256sums+=('7a7f2cfb89615269e28451b17effd9ae81c01135de70ef463093b9916a368008')
noextract+=('jetpytools-3.1.2-py3-none-any.whl')
source+=('vsjetpack-2.2.6-py3-none-any.whl::https://files.pythonhosted.org/packages/50/32/9359de2b97f25528a62c666f21eaf80893787db468658f3c4bcb52b5aa4f/vsjetpack-2.2.6-py3-none-any.whl')  # vsjetpack 2.2.6
sha256sums+=('5835d0a4011555ea29bbba15055fbf605d5668b8bd6832f36866ef0c56e0e335')
noextract+=('vsjetpack-2.2.6-py3-none-any.whl')
# END generated: python

build() {
  cd "$_srcname"
  rm -rf "$srcdir"/{plugins-out,plugin-licenses,dist}   # stale output of an earlier makepkg run
  # Bundled native plugins (offline, from the pinned tarballs above); -jN from MAKEFLAGS.
  local jobs=${QTGMC6UI_JOBS:-}
  [[ -n $jobs || ! ${MAKEFLAGS:-} =~ -j[[:space:]]*([0-9]+) ]] || jobs=${BASH_REMATCH[1]}
  QTGMC6UI_JOBS=${jobs:-$(nproc)} PYTHON=/usr/bin/python3 QTGMC6UI_LICENSE_DIR="$srcdir/plugin-licenses" \
    bash packaging/plugins/build.sh "$_plugin_set" "$srcdir" "$srcdir/plugins-out"
  # The application wheel.
  python -m build --wheel --no-isolation --outdir "$srcdir/dist"
}

package() {
  cd "$_srcname"
  local root="$pkgdir/usr/lib/$pkgname" venv="$pkgdir$_venv"
  local pyver
  pyver=$(python3 -c 'import sys; print("%d.%d" % sys.version_info[:2])')

  install -d "$root/plugins"
  cp -a --no-preserve=ownership "$srcdir/plugins-out/." "$root/plugins/"

  # Offline venv on the versioned system python with system site-packages (Arch provides
  # vapoursynth/PySide6/numpy): hash-pinned wheels from source=(), then the app wheel.
  export UV_NO_CONFIG=1 UV_OFFLINE=1 UV_NO_PROGRESS=1 UV_LINK_MODE=copy \
         UV_PYTHON_DOWNLOADS=never UV_PYTHON_PREFERENCE=only-system \
         UV_CACHE_DIR="$srcdir/uv-cache"
  rm -rf "$UV_CACHE_DIR"   # a cache kept from an earlier makepkg run would serve a stale app wheel
  uv venv --python "/usr/bin/python$pyver" --system-site-packages --no-project "$venv"
  uv export --frozen --offline --no-emit-project --no-header --no-dev \
      -o "$srcdir/requirements.txt" >/dev/null
  uv pip install --python "$venv/bin/python" --no-deps --no-index --require-hashes \
      --find-links "$srcdir" --no-compile -r "$srcdir/requirements.txt"
  # Python side of the bundled plugins (plugins.json python_wheels, e.g. dfttest2).
  local whl wheels
  mapfile -t wheels < <(python3 -I packaging/plugins/manifest.py sources "$_plugin_set" | cut -f2 | grep '\.whl$' || true)
  for whl in "${wheels[@]}"; do
    uv pip install --python "$venv/bin/python" --no-deps --no-index --no-compile "$srcdir/$whl"
  done
  uv pip install --python "$venv/bin/python" --no-deps --no-index --no-compile \
      "$srcdir"/dist/qtgmc_6ui-"$pkgver"-py3-none-any.whl

  # ABI record for `qtgmc-6ui doctor` (loads every plugin once; fails the build if one is broken).
  "$venv/bin/python" -I -B packaging/write-build-info.py \
      --out "$root/build-info.json" --plugin-dir "$root/plugins" \
      --manifest packaging/plugins/manifest.py --plugin-set "$_plugin_set" \
      --site-packages "$venv/lib/python$pyver/site-packages" \
      --pkgver "$pkgver" --pkgrel "$pkgrel" --march "${QTGMC6UI_MARCH:-x86-64}"

  # Relocation + reproducibility clean-up.  venv/bin keeps only the python symlinks (entry
  # scripts carry $pkgdir shebangs; /usr/bin/qtgmc-6ui is the only entry point).
  rm -rf "$venv"/{.lock,.gitignore,CACHEDIR.TAG}
  find "$venv/bin" -mindepth 1 ! -name 'python*' -delete
  find "$venv" -name __pycache__ -prune -exec rm -rf {} +
  local d
  for d in "$venv"/lib/python*/site-packages/*.dist-info; do
    rm -f "$d"/{direct_url.json,uv_cache.json}
    sed -i -e '/^[^,]*direct_url\.json,/d' -e '/^[^,]*uv_cache\.json,/d' \
           -e '/^\.\.\/\.\.\/\.\.\/bin\//d' "$d/RECORD"
  done
  SOURCE_DATE_EPOCH=${SOURCE_DATE_EPOCH:-0} "$venv/bin/python" -I -m compileall -q -f -j1 \
      --invalidation-mode unchecked-hash -s "$pkgdir" -p / "$venv/lib"

  install -Dm755 packaging/qtgmc-6ui.launcher "$pkgdir/usr/bin/qtgmc-6ui"
  install -Dm644 packaging/qtgmc-6ui.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 src/qtgmc_6ui/gui/resources/qtgmc-6ui.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cp -r --no-preserve=ownership "$srcdir/plugin-licenses/." "$pkgdir/usr/share/licenses/$pkgname/"
  # licence texts of sub-sources (generated _extra_licenses: tarball|member|dest)
  local entry file member dest top
  for entry in "${_extra_licenses[@]}"; do
    IFS='|' read -r file member dest <<<"$entry"
    top=$(bsdtar -tf "$srcdir/$file" | head -n1 | cut -d/ -f1)
    install -d "$(dirname "$pkgdir/usr/share/licenses/$pkgname/$dest")"
    bsdtar -xOf "$srcdir/$file" "$top/$member" >"$pkgdir/usr/share/licenses/$pkgname/$dest"
    chmod 644 "$pkgdir/usr/share/licenses/$pkgname/$dest"
  done
  local lic dist
  for lic in "$venv"/lib/python*/site-packages/*.dist-info/licenses; do
    dist=$(basename "$(dirname "$lic")"); dist=${dist%%-[0-9]*}
    [[ $dist == qtgmc_6ui ]] && continue
    ln -s "${lic#"$pkgdir"}" "$pkgdir/usr/share/licenses/$pkgname/python-$dist"
  done
}
