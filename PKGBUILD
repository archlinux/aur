# Maintainer: dreieck


# _check_legal() {
#   # We want to check for this _before_ downloading.
#   # But this has the disadvantage that this is asked at the beginning of a makepkg run, and again when starting the package-functions, and each time `.SRCINFO` is generated, and `namcap` also fails on this `PKGBUILD`.
#   # If anyone has an idea how to make it in a more clean way & that the question is only asked once, while still downloading the source via the 'source' array, please leave a comment!
#   local _legalcopy
#   msg2 "Please make sure you have obtained a legal copy of the game before continuing!"
#   read -e -p "Enter 'i have a legal copy of the riven soundtrack' (without quotes) to continue, anything else to abort: " _legalcopy
#   if [ "${_legalcopy}x" != "i have a legal copy of the riven soundtrack"x ]; then
#     error "No legal copy, aborting."
#     return 22
#   fi
# }
# _check_legal || exit "$?"

_pkgbase="riven-soundtrack"
pkgbase="${_pkgbase}"
pkgname=(
  "riven-soundtrack"
)
pkgdesc="Official Soundtrack of the game 'Riven: The Sequel to Myst'."
groups=(
  'myst'
  'riven'
)
arch=('any')
url='http://www.robynmiller.net/music'
# url='https://www.discogs.com/release/1097332-Robyn-Miller-Riven-The-Soundtrack'
# url='https://archive.org/details/Nova_RivenOST_USA'
epoch="0"
pkgver='19980224' # Release date according to https://www.discogs.com/release/1097332-Robyn-Miller-Riven-The-Soundtrack
pkgrel=2
makedepends=(
  'ffmpeg'              # To convert the raw CD .bin files to opus.
  'ghostscript'         # To build the CD booklet PDF (build multi-page PDF).
  'imagemagick'         # To build the CD booklet PDF (resize images and convert to PDF).
  'ocrmypdf'            # To build the CD booklet PDF (add OCR data).
  'tesseract-data-eng'  # To build the CD booklet PDF (add OCR data).
)
options+=('emptydirs')

source=(
  'Robyn_Miller_-_Riven_-_The_Soundtrack.7z::https://archive.org/download/Nova_RivenOST_USA/Riven%20-%20The%20Soundtrack%20%28USA%29.7z'
  # 'riven-soundtrack_-_cover.jpg::https://archive.org/download/Nova_RivenOST_USA/__ia_thumb.jpg'
  'riven-soundtrack_-_01.jpg::https://archive.org/download/Nova_RivenOST_USA/Riven%20-%20The%20Soundtrack%20%28USA%29/1.jpg'
  'riven-soundtrack_-_02.jpg::https://archive.org/download/Nova_RivenOST_USA/Riven%20-%20The%20Soundtrack%20%28USA%29/2.jpg'
  # 'riven-soundtrack_-_03.jpg::https://archive.org/download/Nova_RivenOST_USA/Riven%20-%20The%20Soundtrack%20%28USA%29/3.jpg'
  'riven-soundtrack_-_04.jpg::https://archive.org/download/Nova_RivenOST_USA/Riven%20-%20The%20Soundtrack%20%28USA%29/4.jpg'
  'riven-soundtrack_-_05.jpg::https://archive.org/download/Nova_RivenOST_USA/Riven%20-%20The%20Soundtrack%20%28USA%29/5.jpg'
  'riven-soundtrack_-_06a.jpg::https://archive.org/download/Nova_RivenOST_USA/Riven%20-%20The%20Soundtrack%20%28USA%29/6a.jpg'
  'riven-soundtrack_-_06b.jpg::https://archive.org/download/Nova_RivenOST_USA/Riven%20-%20The%20Soundtrack%20%28USA%29/6b.jpg'
  'riven-soundtrack_-_06c.jpg::https://archive.org/download/Nova_RivenOST_USA/Riven%20-%20The%20Soundtrack%20%28USA%29/6c.jpg'
  'riven-soundtrack_-_06d.jpg::https://archive.org/download/Nova_RivenOST_USA/Riven%20-%20The%20Soundtrack%20%28USA%29/6d.jpg'
  'riven-soundtrack_-_06e.jpg::https://archive.org/download/Nova_RivenOST_USA/Riven%20-%20The%20Soundtrack%20%28USA%29/6e.jpg'
  'riven-soundtrack_-_06f.jpg::https://archive.org/download/Nova_RivenOST_USA/Riven%20-%20The%20Soundtrack%20%28USA%29/6f.jpg'
  'riven-soundtrack_-_06g.jpg::https://archive.org/download/Nova_RivenOST_USA/Riven%20-%20The%20Soundtrack%20%28USA%29/6g.jpg'
  'riven-soundtrack_-_06h.jpg::https://archive.org/download/Nova_RivenOST_USA/Riven%20-%20The%20Soundtrack%20%28USA%29/6h.jpg'
  'tracks.txt'
  'license-note.txt'
)

sha256sums=(
  'c2268e57d2431781cd3fde942cac54d2015014f4e53ea63d1395e4c8d2888159'
  # '8a7afda926b12a8f97435b51e88974b13e63b9e6dd8495e27a87ecf785a1b4b7'
  '790e1ab6383fcaad4a1b7eb9f1e866dce07fcee2006174244dd9f5bc503eb9fa'
  'e7ee5d43781f7f3699851792851adaed6e943358838318cf2974b1cb753d5851'
  # 'fc83c58111a54a8993dc55aecb0ed1b76441ded090a82dda96e99d674445c011'
  'a51bc788f64ccf40662633f35e47d690efb744ce3eeeffea0ae995044d131a13'
  'e8175556124b0ed6eca972fac33a6cf4c853cc146c4c1ccbda47951d3a6628fd'
  'e1f6faebe88fba254e714e8f164b53f3d4e77cdb6a0fdb805cef03401b5b387e'
  '035ee380d685ed1349b0f3cb0105bb927316fe6415ca5974928067f27958f676'
  'a3fabd6df4345e4a5afbb428d310278c6070c8ac0a8e6ae94c256d2d528537fc'
  '57eda9798780406f37bc4e4e52fb537675e8336f9e3323aaec4783ffada33f31'
  '01fe7d6b65347f31f970cdaa093b7750246fed4743cb59be56991a718bf1e45f'
  '40421ff731ce14d14c2449f6fdc747fe72c56bce33c21fd3a80a3058817d53b5'
  '44ef8066b277b033f3acbee494802df3f1b7010aec65fd594c4033750cd73d0c'
  '810f99659b802b05f1e103d5334b8de85b8a759144755bdcdfe63a9790cf110e'
  'badcd45b33c681bb6185d41a862590a19ef392b590fd3e2c16f7969656b79666'
  'f08b8880a05065200f6481e985f76f5e037b246c77da605b3090219486015435'
)


prepare() {
  cd "${srcdir}"

  local _legalcopy
  msg2 "Please make sure you have obtained a legal copy of the game before continuing!"
  read -e -p "Enter 'i have a legal copy of the riven soundtrack' (without quotes) to continue, anything else to abort and DELETE DOWNLOADED DATA: " _legalcopy
  if [ "${_legalcopy}x" != "i have a legal copy of the riven soundtrack"x ]; then
    rm -fv "${SRCDEST}/${source[0]%%::*}"
    rm -Rfv "${srcdir}"/*
    error "No legal copy, aborting."
    return 22
  fi
}

build() {
  cd "${srcdir}"

  printf '%s\n' "Generating opus sound files ..."
  _composer="Robyn Miller"
  _album="Riven - The Soundtrack"
  _genre="Video Game Music"
  _date="1997"
  _outdir="build/`printf '%s' "${_composer}_-_${_album}" | tr -d \' | tr ' ' '_'`"
  mkdir -p "${_outdir}"
  for _trackno in `seq -w 01 20`; do
    _rawfile="Riven - The Soundtrack (USA) (Track ${_trackno}).bin"
    _title="`sed -n "${_trackno}"p 'tracks.txt'`"
    _outfile="`printf '%s' "${_trackno}_-_${_title}" | tr -d \' | tr ' ' '_'`.opus.webm"
    printf '%s\n' "  Track number ${_trackno}: '${_title}' ..."
    ffmpeg \
      -f s16le -ar 44.1k -ac 2 -i "${_rawfile}" \
      -vn \
      -c:a libopus -b:a 229376 -vbr on -compression_level 10 -frame_duration 60 -application audio \
      -metadata artist="${_composer}" -metadata composer="${_composer}" -metadata album="${_album}" -metadata track="${_trackno}" -metadata title="${_title}" -metadata genre="${_genre}" -metadata date="${_date}" \
      -y "${_outdir}/${_outfile}"
  done

  printf '%s\n' "Generating album art picture ..."
  convert riven-soundtrack_-_01.jpg -resize 1400x1400 -quality 85 "${_outdir}/cover.jpg"
  # convert riven-soundtrack_-_01.jpg -resize 128x128 -quality 65 "${_outdir}/cover.small.jpg"

  printf '%s\n' "Generating CD booklet PDF ..."
  ## Separating re-encoding and combination in order to conserve system memory. Doing all in a single `convert` run leads to out of memory kill on a 8 GiB RAM machine.
  for _jpg in riven-soundtrack_-_04.jpg riven-soundtrack_-_02.jpg riven-soundtrack_-_06*.jpg; do
    printf '%s\n'   "  Converting '$(basename "${_jpg}" '.jpg')' from JPEG to PDF ..."
    convert \
      "${_jpg}" \
      -resize 8192x2048 -compress jpeg -quality 90 \
      "$(basename "${_jpg}" '.jpg').pdf"
  done
  printf '%s\n'   "  Combining to multipage PDF ..."
  gs \
    -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite \
    -sOutputFile="${_outdir}/Robyn_Miller_-_Riven_-_The_Soundtrack.CD-Booklet.pdf" \
    riven-soundtrack_-_04.pdf riven-soundtrack_-_02.pdf riven-soundtrack_-_06*.pdf
  printf '%s\n'   "  Adding OCR information ..."
  ocrmypdf \
    -l eng --output-type pdfa-3 -O 1 \
    --title "Riven - The Soundtrack" --author "Robyn Miller" --subject "CD booklet" --keywords "Video Game Music" \
    "${_outdir}/Robyn_Miller_-_Riven_-_The_Soundtrack.CD-Booklet.pdf" "${_outdir}/Robyn_Miller_-_Riven_-_The_Soundtrack.CD-Booklet.pdf"

  cp "tracks.txt" "${_outdir}/tracklist.txt"
  printf '%s\n' "${url}" > "${_outdir}/website.url"
}

package_riven-soundtrack() {
  pkgdesc="Official Soundtrack of the game 'Riven: The Sequel to Myst'."
  url='http://www.robynmiller.net/music'
  license=('custom: proprietary')
  optdepends=(
    'riven: To play the game.'
    "riven-makingof: Movie 'The Making of Riven'."
  )

  cd "${srcdir}"

  _destdir="${pkgdir}/usr/share/music"
  install -v -d -m755 "${_destdir}"
  cp -rv "build"/* "${_destdir}/"

  install -v -D -m644 "${srcdir}/license-note.txt" "${pkgdir}/usr/share/licenses/${pkgname}/Riven_-_The_Soundtrack.license-note.txt"
}
