pkgbase=redump-bioses
pkgname=(psx-bios ps2-bios xbox-bios gamecube-bios)
pkgver=20210918
pkgrel=1
pkgdesc="Set of BIOSes for various consoles."
arch=('any')
url="https://en.wikipedia.org/wiki/BIOS"
depends=()
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("gamecube.zip::https://archive.org/download/2019_11_25_redump_bios/Redump-BIOS/Nintendo%20-%20GameCube%20-%20BIOS%20%2816%29%20%282021-09-18%29.zip"
        "psx.zip::https://archive.org/download/2019_11_25_redump_bios/Redump-BIOS/Sony%20-%20PlayStation%20-%20BIOS%20%2824%29%20%282016-10-21%29.zip"
	"ps2.zip::https://archive.org/download/2019_11_25_redump_bios/Redump-BIOS/Sony%20-%20PlayStation%202%20-%20BIOS%20%28107%29%20%282019-11-25%29.zip"
	"xbox.zip::https://archive.org/download/2019_11_25_redump_bios/Redump-BIOS/Microsoft%20-%20Xbox%20-%20BIOS%20%287%29%20%282010-09-13%29.zip")
sha256sums=("01180a3675a1e71fbf3255248c87e704a3bb0a25c146213424e70079ae505189"
	    "42a717072fa6de457c60005a6eaf9c299b5fa09c39387e23d5c2412c1135c8e2"
	    "e47ca700e9ecf9e7606381a2a1554a63ca773feeeb8057c3897b7ac9b056f6ad"
	    "4c1ef691a301d6fe330ec4d6a00c464ed2ca46ab4238e06074ca0facc5817b1a")

package_gamecube-bios(){
  local _platform="gamecube"
  local _dest="${pkgdir}/usr/share/${_platform}"
  local _file
  mkdir -p "${_dest}"
  for _file in "gc-"* ; do
    unzip -d "${_dest}" "${_file}"
  done
}

package_psx-bios(){
  local _platform="ps"
  local _dest="${pkgdir}/usr/share/${_platform}x"
  local _file
  mkdir -p "${_dest}"
  for _file in "${_platform}"{"one-","-"}* ; do
    unzip -d "${_dest}" "${_file}"
  done
}

package_ps2-bios(){
  local _platform="ps2"
  local _dest="${pkgdir}/usr/share/${_platform}"
  local _file
  mkdir -p "${_dest}"
  for _file in "${_platform}-"* ; do
    unzip -d "${_dest}" "${_file}"
  done
}

package_xbox-bios(){
  local _platform="xbox"
  local _dest="${pkgdir}/usr/share/${_platform}"
  local _file
  mkdir -p "${_dest}"
  for _file in "${_platform}-"* ; do
    unzip -d "${_dest}" "${_file}"
  done
}
